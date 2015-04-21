class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.integer :match_id, null: false
      t.integer :board_id, null: false
      t.string :type, null: false
      t.json :slots, null: false, default: []
      t.timestamps null: false
    end
    add_index :tracks, :match_id
    add_index :tracks, :board_id
  end
end
