class RenameItemSutatsColumnToOrderDetail < ActiveRecord::Migration[5.2]
  def change
    rename_column :order_details, :item_sutats, :item_status
  end
end
