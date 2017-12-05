module GoogleDrive
  class UpsertInSpreadsheet
    include GoogleDrive::Helpers

    def call
      associate_resources
      upsert_data
    end

    private

    def upsert_data
      @list = @ws.list
      # @row = @ws.num_rows + 1
      @query.find_each do | resource |
        row = @list.select {|el| "#{el['id']}" == "#{resource.id}"}.first
        row ? row.replace(build_row(resource)) : @list.push(build_row(resource))
      end
      @ws.save
    end
  end
end


# Lead.find_each do |l|
#   l.user_id = 6 if l.user_id.nil?
#   l.state = 'created'
#   l.build_status = 'active'
#   l.save
# end
# Lead.find_each do |l|
#   l.update(created_at: l.created_at - 10.seconds)
# end
