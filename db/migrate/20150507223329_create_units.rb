class CreateUnits < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.references :board, index: true, foreign_key: true
      t.string :type
      t.string :territory
      t.integer :x
      t.integer :y
      t.boolean :routed

      t.timestamps null: false
    end
  end
end
