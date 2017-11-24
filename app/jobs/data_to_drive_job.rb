class DataToDriveJob < ApplicationJob
  queue_as :default

  def perform(ws_title)
    puts 'YOUHOU'
    GoogleDrive::DbToSpreadsheetExport.new.call(ws_title)
  end
end
