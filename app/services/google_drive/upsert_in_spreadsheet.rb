module GoogleDrive
  class UpsertInSpreadsheet
    include GoogleDrive::Helpers

    def call
      associate_resources
      binding.pry
      upsert_data
    end

    private

    def upsert_data
      @list = @ws.list
      @row = @ws.num_rows + 1
      @query.find_each do | resource |
        row = @list.select {|el| el['id'] == resource.id}.first
        row ? row.replace(build_row(resource)) : @list.push(build_row(resource))
      end
      @ws.save
    end
  end
end
