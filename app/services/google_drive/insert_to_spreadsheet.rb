module GoogleDrive#::DbToSpreadsheetExport
  class InsertToSpreadsheet
    def initialize
      @session = GoogleDrive::Session.from_service_account_key("config/gal-1ff0c255cc9d.json")
      @spreadsheet = @session.spreadsheet_by_key(ENV['LEAD_AUTO_SPREADSHEET_KEY'])
    end

    def call(wsheet_title, ids)
      @ws = @spreadsheet.worksheet_by_title(wsheet_title)
      @klass = wsheet_title.classify.constantize
      @column_names = @klass.column_names
      associate_resources(wsheet_title, ids)
      insert_data
    end

    private

    def insert_data
      # Use serializers & List...
      @row = @ws.num_rows
      @klass.find_each do | resource |
        values = build_row(resource)
        (1..@ws.num_cols).each do |col|
          @ws[@row, col] = values[col-1]
        end
        @row += 1
      end
      @ws.save
    end

    def associate_resources(wsheet_title, ids)
      if wsheet_title == 'users'
        @klass = @klass.includes(:prospect_areas, :tags, :industry_subcategories)
        @column_names << %w(prospect_areas tags industry_subcategories)
        @column_names.flatten!
      elsif wsheet_title == 'leads'
        @klass = @klass.includes(:tags, :propositions)
        @column_names << %w(tags propositions)
        @column_names.flatten!
      end
      @klass = @klass.where(id: ids) if ids.present?
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
