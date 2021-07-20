class ChangeColumnDefaultToOrders < ActiveRecord::Migration[5.2]
  def change
    change_column_default :orders, :delivery_fee, from: nil, to: "800"
    change_column_default :orders, :payment_method, from: nil, to: "0"
    change_column_default :orders, :order_status, from: nil, to: "0"
  end
end
