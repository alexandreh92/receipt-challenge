# frozen_string_literal: true

module Exceptions
  module ExceptionHandler
    def with_exception_handler
      yield
    rescue Exceptions::CommandNotFound => e
      puts e.message
      retry
    end
  end
end
