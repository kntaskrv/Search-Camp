class AddAcceptedColumnToVoucher < ActiveRecord::Migration[5.2]
  def change
    add_column :vouchers, :accepted, :boolean, default: false
  end
end
