# frozen_string_literal: true

module Repl
  class Base
    include Exceptions::ExceptionHandler

    def initialize
      clear
    end

    def run
      with_exception_handler do
        loop do
          puts title unless title.empty?
          puts options_to_a
          command = gets.chomp.strip

          exit if command.match?(/exit/i)
          raise Exceptions::CommandNotFound unless options.key?(command.to_sym)

          send(options[command.to_sym][:method])

          puts "----------------- \n"
        end
      end
    end

    private

      def title; end

      def clear
        system('clear') || system('cls')
      end

      def options
        raise 'Not implemented yet'
      end

      def options_to_a
        options.map { |key, value| "#{key}: #{value[:label]}" }
      end

      def run_command(command, opts = { clear: true })
        clear if opts[:clear]

        puts command
        gets.chomp.strip
      end
  end
end
