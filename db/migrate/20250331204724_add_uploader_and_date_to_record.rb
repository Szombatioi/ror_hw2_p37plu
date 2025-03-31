class AddUploaderAndDateToRecord < ActiveRecord::Migration[8.0]
  def change
    add_column :records, :uploader, :string
    add_column :records, :date, :date
  end
end
