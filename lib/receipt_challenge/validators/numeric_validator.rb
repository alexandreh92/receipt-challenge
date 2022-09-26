module Validators
  class NumericValidator
    def self.valid?(value)
      !Float(value).nil?
    rescue StandardError
      false
    end
  end
end
