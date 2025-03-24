class CreateLands < ActiveRecord::Migration[8.0]
  def change
    create_table :lands do |t|
      t.string :name
      t.string :img_name

      t.timestamps
    end
  end
end
