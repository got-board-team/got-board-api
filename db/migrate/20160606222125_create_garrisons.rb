class CreateGarrisons < ActiveRecord::Migration
  def change
    create_table :garrisons do |t|
      t.string :name
      t.integer :match_id
      t.string :territory
      t.integer :x
      t.integer :y

      t.timestamps null: false
    end

    add_index :garrisons, :match_id
  end
end
