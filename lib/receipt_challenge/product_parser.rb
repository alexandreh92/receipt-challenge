class ProductParser
  attr_reader :text

  def initialize(opts = {})
    @text = opts[:text]
  end

  def parse
    first_sentence, price = parse_raw_text
    amount, *name = parse_first_sentence(first_sentence)

    Receipt.add_product(
      Product.new(amount: amount, name: name.join(' '), price: price)
    )
  end

  private

    def parse_raw_text
      first_sentence, price = text.split(/(?<![\w\d])at(?![\w\d])/i)

      [first_sentence.strip, price.strip]
    end

    def parse_first_sentence(first_sentence)
      first_sentence.split(' ')
    end
end
