class Product
  IMPORTED_TAX = 0.05 # 5%
  BASIC_TAX = 0.1 # 10%

  attr_reader :name

  def initialize(opts = {})
    @amount = opts[:amount]
    @name = opts[:name]
    @price = opts[:price]
  end

  def valid?
    amount_valid? && name_valid? && price_valid?
  end

  def imported?
    name.match?(/imported/i)
  end

  def price
    return nil unless price_valid?

    @price.to_f
  end

  def amount
    return nil unless amount_valid?

    @amount.to_i
  end

  def tax_free?
    name.match?(/book|pills|chocolate/i)
  end

  def tax
    basic_tax + imported_tax
  end

  private

    def imported_tax
      return 0 unless imported?

      price * IMPORTED_TAX
    end

    def basic_tax
      return 0 if tax_free?

      price * BASIC_TAX
    end

    def amount_valid?
      Validators::NumericValidator.valid?(@amount)
    end

    def name_valid?
      Validators::StringValidator.valid?(name)
    end

    def price_valid?
      Validators::NumericValidator.valid?(@price)
    end
end
