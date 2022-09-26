class Receipt
  @@products = []

  class << self
    def products
      @@products
    end

    def add_product(product)
      @@products << product if product.valid?
    end

    def generate_receipt
      @@products.each do |product|
        puts stringify_product(product)
      end
      puts "Sales Taxes: #{format('%.2f', sales_taxes)}"
      puts "Total: #{format('%.2f', total)}"
    end

    def stringify_product(product)
      "#{product.amount} #{product.name} at #{product.price}"
    end

    def sales_taxes
      @@products.reduce(0) { |acc, product| acc + product.amount * product.tax }.ceil(2)
    end

    def total_price
      @@products.reduce(0) { |acc, product| acc + product.amount * product.price }
    end

    def total
      total_price + sales_taxes
    end
  end
end
