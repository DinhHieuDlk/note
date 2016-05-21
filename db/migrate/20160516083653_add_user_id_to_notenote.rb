class AddUserIdToNotenote < ActiveRecord::Migration
  def change
    add_column :notenotes, :user_id, :integer
  end
end
