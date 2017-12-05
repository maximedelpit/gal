namespace :drive do
  desc "Copy users from DB to drive"
  task copy_users: :environment do
    # user_ids = User.where(updated_at: (15.minutes.ago..Time.now)).pluck(:id)
    DataToDriveJob.perform_later('users')
  end

  desc "Copy leads from DB to drive"
  task copy_leads: :environment do
    # lead_ids = User.where(updated_at: (15.minutes.ago..Time.now)).pluck(:id)
    DataToDriveJob.perform_later('leads')
  end
end
