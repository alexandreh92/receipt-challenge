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
        clear
        puts "Insert the product's amount, description and price " \
             '([amount:number] [description:string] at [price:double]):'
        command = gets.chomp.strip
        puts command
      end

      def generate_receipt
        clear
        puts 'runnn'
      end
  end
end
