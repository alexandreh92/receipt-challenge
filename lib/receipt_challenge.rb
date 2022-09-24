# frozen_string_literal: true

require 'pry'

Dir[File.join('./lib/**/*.rb')].sort.each { |f| require f }

module ReceiptChallenge
end
