# frozen_string_literal: true

module Repl
  class MainProgram < Base
    private

      def title
        'Select an option:'
      end

      def options
        {
          '1': { label: 'Add product to cart', method: 'add_to_cart' },
          '2': { label: 'Generate receipt', method: 'generate_receipt' }
        }
      end

      def add_to_cart
        input = run_command("Insert the product's amount, description and price " \
        '([amount:number] [description:string] at [price:double]):')

        ProductParser.new(text: input).parse
      end

      def generate_receipt
        clear

        Receipt.generate_receipt
      end
  end
end
