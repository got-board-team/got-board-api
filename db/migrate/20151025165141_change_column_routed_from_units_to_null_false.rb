class ChangeColumnRoutedFromUnitsToNullFalse < ActiveRecord::Migration
  def change
    Unit.update_all(routed: false)
    change_column :units, :routed, :boolean, null: false
  end
end
