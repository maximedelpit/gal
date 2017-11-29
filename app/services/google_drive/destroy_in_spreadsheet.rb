module GoogleDrive
  class DestroyInSpreadsheet
    include GoogleDrive::Helpers

    def call
      associate_resources
      destroy_data
    end

    private

    def destroy_data
      @ids.each do | id |
        (2..@ws.num_rows).each {|i| @row_index = i if "#{@ws[i, 1]}" == "#{id}"}
        @ws.delete_rows(@row_index, 1)
      end
      @ws.save
    end
  end
end
