class DataToDriveJob < ApplicationJob
  queue_as :default

  def perform(service_name, ws_title, ids=[])
    service_name.constantize.new(ws_title, ids).call
  end
end
