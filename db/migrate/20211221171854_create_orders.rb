class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :price
      #gives singluar coffee and customer ID's
      t.references :coffee
      t.references :customer
    end
  end
end
