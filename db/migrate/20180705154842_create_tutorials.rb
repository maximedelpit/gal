class CreateTutorials < ActiveRecord::Migration[5.1]
  def change
    create_table :tutorials do |t|
      t.string :title
      t.string :description
      t.string :youtube_id

      t.timestamps
    end
  end
end
