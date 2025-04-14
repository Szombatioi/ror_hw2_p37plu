class AddUsernameToComments < ActiveRecord::Migration[8.0]
  def change
    add_column :comments, :username, :string
  end
end
