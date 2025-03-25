class AddIsEditorToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :is_editor, :boolean
  end
end
