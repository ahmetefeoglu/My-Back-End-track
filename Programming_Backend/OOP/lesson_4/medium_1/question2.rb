class InvoiceEntry
  attr_accessor  :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    # prevent negative quantities from being set
    self.quantity = updated_count if updated_count >= 0
  end
end

product = InvoiceEntry.new('nutella', 7)
product.update_quantity(10)
puts product.quantity