class AddFieldClassToVouchers < ActiveRecord::Migration[5.2]
  def change
    add_column :vouchers, :class_num, :integer
  end
end
