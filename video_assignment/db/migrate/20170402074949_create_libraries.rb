class CreateLibraries < ActiveRecord::Migration[5.0]
  def change
    create_table :libraries do |t|
      t.string :title
      t.string :youtube_url
      t.string :start_time
      t.string :end_time

      t.timestamps
    end
  end
end
