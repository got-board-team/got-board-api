class AddRoundToMatches < ActiveRecord::Migration
  def change
    add_column :matches, :round, :integer, null: false, default: 1
  end
end
