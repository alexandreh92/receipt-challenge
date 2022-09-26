module Validators
  class StringValidator
    def self.valid?(value)
      value.is_a?(String) && !value.nil?
    end
  end
end
