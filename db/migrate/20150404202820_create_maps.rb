class CreateMaps < ActiveRecord::Migration
  def change
    create_table :maps do |t|
      t.integer :match_id, null: false
      t.integer :board_id, null: false
      t.boolean :use_kings_court_overlay, default: false, null: false
      t.timestamps null: false
    end
    add_index :maps, :match_id
    add_index :maps, :board_id
  end
end
