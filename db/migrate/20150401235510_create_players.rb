class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.integer :match_id, null: false
      t.string :house, null: false
      t.timestamps null: false
    end
    add_index :players, :match_id
    add_index :players, [:match_id, :house], unique: true
  end
end
