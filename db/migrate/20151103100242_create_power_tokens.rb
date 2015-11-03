class CreatePowerTokens < ActiveRecord::Migration
  def change
    create_table :power_tokens do |t|
      t.references :board, index: true, foreign_key: true
      t.references :player, index: true, foreign_key: true
      t.string :territory
      t.integer :x, null: false, default: 0
      t.integer :y, null: false, default: 0

      t.timestamps null: false
    end
  end
end
