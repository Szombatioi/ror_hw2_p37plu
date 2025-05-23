class CreateRecords < ActiveRecord::Migration[8.0]
  def change
    create_table :records do |t|
      t.string :title
      t.text :lyrics
      t.string :link
      t.references :land, null: false, foreign_key: true

      t.timestamps
    end
  end
end
