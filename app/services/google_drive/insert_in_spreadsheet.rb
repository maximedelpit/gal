module GoogleDrive
  class InsertInSpreadsheet
    include GoogleDrive::Helpers

    def call
      associate_resources
      insert_data
    end

    private

    def insert_data
      # Use serializers & List...
      @list = @ws.list
      @row = @ws.num_rows + 1
      @query.find_each { | resource | @list.push(build_row(resource))}
      @ws.save
    end
  end
end
