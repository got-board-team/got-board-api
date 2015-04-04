class CreateMapAreas < ActiveRecord::Migration
  def change
    create_table :map_areas do |t|
      t.integer :match_id, null: false
      t.integer :map_id, null: false
      t.citext :slug, null: false
      t.string :type, null: false
      t.string :fortification_type
      t.integer :barrels_count, null: false, default: 0
      t.integer :crowns_count, null: false, default: 0
      t.string :house_sigil
      t.integer :port_owner_id
      t.timestamps null: false
    end
    add_index :map_areas, :match_id
    add_index :map_areas, :map_id
    add_index :map_areas, :port_owner_id
    add_index :map_areas, [:map_id, :slug], unique: true
  end
end
