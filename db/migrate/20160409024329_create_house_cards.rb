class CreateHouseCards < ActiveRecord::Migration
  def change
    create_table :house_cards do |t|
      t.string :name, null: false
      t.integer :x, null: false, default: 0
      t.integer :y, null: false, default: 0
      t.boolean :faceup, null: false, default: false
      t.datetime :discarted_at

      t.references :player, null: false
      t.references :board

      t.timestamps null: false
    end
  end
end
