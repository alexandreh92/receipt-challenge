require 'spec_helper'

RSpec.describe ProductParser do
  subject(:parser) { described_class.new(text: text) }

  describe '#parse' do
    let(:product_double) { instance_double(Product) }

    let(:text) { '2 box of chocolate at 30.20' }

    before do
      allow(Product).to receive(:new).with(amount: '2', name: 'box of chocolate',
                                           price: '30.20').and_return(product_double)
      allow(product_double).to receive(:valid?).and_return(true)

      parser.parse
    end

    it 'adds a product instance to receipt products' do
      expect(Receipt.class_variable_get(:@@products)).to include(product_double)
    end
  end
end
