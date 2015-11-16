class ChangeColumnFaceupFromOrderTokensToNullFalse < ActiveRecord::Migration
  def change
    OrderToken.update_all(faceup: false)
    change_column :order_tokens, :faceup, :boolean, null: false
  end
end
