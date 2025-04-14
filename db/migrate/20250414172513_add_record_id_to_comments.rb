class AddRecordIdToComments < ActiveRecord::Migration[8.0]
  def change
    add_reference :comments, :record, null: false, foreign_key: true
  end
end
