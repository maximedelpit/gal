class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def extract_db_to_drive
    DataToDriveJob.perform_later("GoogleDrive::DbToSpreadsheetExport", self.class.table_name)
  end

  def insert_in_spreadsheet
    DataToDriveJob.perform_later("GoogleDrive::InsertInSpreadsheet", self.class.table_name, [self.id])
  end

  def upsert_in_spreadsheet
    DataToDriveJob.perform_later("GoogleDrive::UpsertInSpreadsheet", self.class.table_name, [self.id])
  end

  def destroy_in_spreadsheet
    DataToDriveJob.perform_later("GoogleDrive::DestroyInSpreadsheet", self.class.table_name, [self.id])
  end
end
