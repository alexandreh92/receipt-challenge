# frozen_string_literal: true

module Exceptions
  class Base < StandardError
    def initialize
      @message = message
      super(@message)
    end
  end
end
