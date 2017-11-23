class DataToDriveJob < ApplicationJob
  queue_as :default

  def perform(ws_title)
    puts 'YOUHOU'
    GoogleDrive::DbToSpreadsheetExport.new.perform(ws_title)
  end
end
