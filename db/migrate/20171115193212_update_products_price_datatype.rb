class UpdateProductsPriceDatatype < ActiveRecord::Migration[5.1]
  def change
  	change_column :products, :price, :integer, using: 'price::integer'
  end
end
