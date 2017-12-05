module GoogleDrive#::DbToSpreadsheetExport
  class DbToSpreadsheetExport
    include GoogleDrive::Helpers

    def call
      associate_resources
      update_data
    end

    private

    def clear_extra_rows
      @ws.delete_rows(@row, (@ws.num_rows - @row + 1))
    end

    def update_data
      # we skip first sheet row so we substract 1 to our resource array
      generate_header
      @row = 2
      @query.find_each do | resource |
        values = build_row(resource)
        (1..@ws.num_cols).each do |col|
          @ws[@row, col] = values[col-1]
        end
        @row += 1
      end
      clear_extra_rows
      @ws.save
    end

    def generate_header
      @column_names.each_with_index do |col_name, i|
        i += 1
        @ws[1, i] = col_name
      end
    end

    def associate_resources
      if @wsheet_title == 'users'
        @query = @klass.includes(:prospect_areas, :tags, :industry_subcategories)
        @column_names << %w(prospect_areas tags industry_subcategories)
        @column_names.flatten!
      elsif @wsheet_title == 'leads'
        @query = @klass.includes(:tags, :propositions)
        @column_names << %w(tags propositions)
        @column_names.flatten!
      end
      @query = @klass.where(id: @ids) if @ids.present?
    end

    def build_row(resource)
      if resource.is_a?(User)
        return build_user_row(resource)
      elsif resource.is_a?(Lead)
        return build_lead_row(resource)
      else
       return resource.attributes.values
      end
    end

    def build_lead_row(resource)
      values = resource.attributes.values
      values << [resource.tags.pluck(:name).join(' / ')]#, resource.propositions.pluck(:mail, :price).map {|pr| "#{pr[0]} (#{pr[1]}€)"}.join(' / ')]
      return values.flatten!
    end

    def build_user_row(resource)
      values = resource.attributes.values
      values << [resource.prospect_areas.pluck(:name).join(' / '), resource.tags.pluck(:name).join(' / '), resource.industry_subcategories.pluck(:name).join(' / ')]
      return values.flatten!
    end
  end
end
