class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.integer :match_id, null: false
      t.timestamps null: false
    end
    add_index :boards, :match_id
  end
end
