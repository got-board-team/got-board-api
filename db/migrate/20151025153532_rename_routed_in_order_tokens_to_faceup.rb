class RenameRoutedInOrderTokensToFaceup < ActiveRecord::Migration
  def change
    rename_column :order_tokens, :routed, :faceup
  end
end
