module GoogleDrive
  class DestoyInSpreadsheet
    include GoogleDrive::Helpers

    def call
      associate_resources
      binding.pry
      destroy_data
    end

    private

    def destroy_data
      @query.find_each do | resource |
        (2..@ws.num_rows).each {|i| @row_index = i if "#{@ws[i, 1]}" == "#{resource.id}"}
        @ws.delete_rows(@row_index, 1)
      end
      @ws.save
    end
  end
end
