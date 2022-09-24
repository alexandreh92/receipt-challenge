# frozen_string_literal: true

module Exceptions
  class CommandNotFound < Base
    def message
      'Command not found.'
    end
  end
end
