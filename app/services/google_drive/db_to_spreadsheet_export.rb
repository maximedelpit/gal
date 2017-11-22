module GoogleDrive
  class DbToSpreadsheetExport
    def initialize
      @session = GoogleDrive::Session.from_service_account_key("config/gal-1ff0c255cc9d.json")
      @spreadsheet = @session.spreadsheet_by_key(ENV['LEAD_AUTO_SPREADSHEET_KEY'])
    end

    def perform(wsheet_title)

    end
  end
end
