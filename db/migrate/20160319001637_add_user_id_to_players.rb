class AddUserIdToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :user_id, :integer
  end
end
