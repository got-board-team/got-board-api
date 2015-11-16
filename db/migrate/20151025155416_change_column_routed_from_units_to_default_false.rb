class ChangeColumnRoutedFromUnitsToDefaultFalse < ActiveRecord::Migration
  def change
    change_column :units, :routed, :boolean, default: false
  end
end
