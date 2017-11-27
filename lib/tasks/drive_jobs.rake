namespace :drive do
  desc "Copy users from DB to drive"
  task copy_users: :environment do
    DataToDriveJob.perform_later('users')
  end

  desc "Copy leads from DB to drive"
  task copy_leads: :environment do
    DataToDriveJob.perform_later('leads')
  end
end
