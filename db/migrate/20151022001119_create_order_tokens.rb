class CreateOrderTokens < ActiveRecord::Migration
  def change
    create_table :order_tokens do |t|
      t.integer :board_id
      t.integer :player_id
      t.string :type
      t.string :territory
      t.integer :x
      t.integer :y
      t.boolean :routed

      t.timestamps null: false
    end
  end
end
