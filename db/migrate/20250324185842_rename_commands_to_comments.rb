class RenameCommandsToComments < ActiveRecord::Migration[8.0]
  def change
    rename_table :commands, :comments
  end
end
