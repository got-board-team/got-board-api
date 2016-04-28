class AddTracksPositionsToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :supply_position, :integer
    add_column :players, :victory_position, :integer
    add_column :players, :throne_position, :integer
    add_column :players, :blade_position, :integer
    add_column :players, :raven_position, :integer

    add_index :players, [:throne_position, :match_id], unique: true
    add_index :players, [:blade_position, :match_id], unique: true
    add_index :players, [:raven_position, :match_id], unique: true
  end
end
