class ChangeLyricsType < ActiveRecord::Migration[8.0]
  def change
    change_column :records, :lyrics, :text, null: true
  end
end
