module GoogleDrive
  module Helpers
    def initialize(wsheet_title, ids=[])
      @session = GoogleDrive::Session.from_service_account_key("config/gal-1ff0c255cc9d.json")
      @spreadsheet = @session.spreadsheet_by_key(ENV['LEAD_AUTO_SPREADSHEET_KEY'])
      @ws = @spreadsheet.worksheet_by_title(wsheet_title)
      @wsheet_title = wsheet_title
      @ids = ids.to_a
      @klass = wsheet_title.classify.constantize
      @column_names = @klass.column_names
    end

    private

    def associate_resources
      if @wsheet_title == 'users'
        @query = @klass.eager_load(:prospect_areas, :tags, :industry_subcategories)
        @column_names << %w(prospect_areas tags industry_subcategories)
        @column_names.flatten!
      elsif @wsheet_title == 'leads'
        @query = @klass.eager_load(:tags, :propositions)
        @column_names << %w(tags propositions)
        @column_names.flatten!
      end
      @query = @query.where(id: @ids) if @ids.present?
    end

    def build_row(resource)
      if resource.is_a?(User)
        return build_user_row(resource)
      elsif resource.is_a?(Lead)
        return build_lead_row(resource)
      else
       return resource.serializable_hash
      end
    end

    def build_lead_row(resource)
      values = resource.serializable_hash
      return values.merge({'tags' => resource.tags.pluck(:name).join(' / ')})
    end

    def build_user_row(resource)
      values = resource.serializable_hash
      return values.merge({
        'prospect_areas' => resource.prospect_areas.pluck(:name).join(' / '),
        'tags' => resource.tags.pluck(:name).join(' / '),
        'industry_subcategories' => resource.industry_subcategories.pluck(:name).join(' / '),
      })
    end
  end
end
