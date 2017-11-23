class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def extract_db_to_drive
    DataToDriveJob.perform_later(self.class.table_name)
  end
end
