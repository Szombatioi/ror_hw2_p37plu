class CreateCommands < ActiveRecord::Migration[8.0]
  def change
    create_table :commands do |t|
      t.text :text
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
