class ChangeColumnFaceupFromOrderTokensToDefaultFalse < ActiveRecord::Migration
  def change
    change_column :order_tokens, :faceup, :boolean, default: false
  end
end
