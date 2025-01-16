class CreatePlatforms < ActiveRecord::Migration[8.0]
  def change
    create_table :platforms do |t|
      t.string :name
      t.date :releaseDate
      t.string :manufacturer

      t.timestamps
    end
  end
end
