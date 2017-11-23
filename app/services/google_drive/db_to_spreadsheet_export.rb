module GoogleDrive
  class DbToSpreadsheetExport
    def initialize
      @session = GoogleDrive::Session.from_service_account_key("config/gal-1ff0c255cc9d.json")
      @spreadsheet = @session.spreadsheet_by_key(ENV['LEAD_AUTO_SPREADSHEET_KEY'])
    end

    def perform(wsheet_title)
      @ws = @spreadsheet.worksheet_by_title(wsheet_title)
      @klass = wsheet_title.classify.constantize
      update_data
    end

    private

    def update_data
      # we skip first sheet row so we substract 1 to our resource array
      generate_header
      row = 2
      @klass.find_each do | resource |
        values = resource.attributes.values
        (1..@ws.num_cols).each do |col|
          @ws[row, col] = values[col-1]
        end
        row += 1
      end
      @ws.save
    end

    def generate_header
      @klass.column_names.each_with_index do |col_name, i|
        i += 1
        @ws[1, i] = col_name
      end
    end
  end
end
