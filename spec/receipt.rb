require 'spec_helper'

RSpec.describe Receipt do
  subject(:receipt) { described_class }

  after do
    receipt.class_variable_set(:@@products, [])
  end

  describe '#add_product' do
    context 'when product is valid' do
      let(:product_double) { instance_double(Product) }

      before do
        allow_any_instance_of(Product).to receive(:new).and_return(product_double)
        allow(product_double).to receive(:valid?).and_return(true)

        receipt.add_product(product_double)
      end

      it 'add product to products' do
        expect(receipt.class_variable_get(:@@products)).to include(product_double)
      end
    end

    context 'when product is not valid' do
      let(:product_double) { instance_double(Product) }

      before do
        allow_any_instance_of(Product).to receive(:new).and_return(product_double)
        allow(product_double).to receive(:valid?).and_return(false)

        receipt.add_product(product_double)
      end

      it 'do not add product to products' do
        expect(receipt.class_variable_get(:@@products)).not_to include(product_double)
      end
    end
  end

  describe '#generate_receipt' do
    let(:product) { Product.new(amount: '2', name: 'imported box of chocolates', price: '3.49') }

    before do
      receipt.add_product(product)
    end

    it 'prints result' do
      expect { receipt.generate_receipt }.to output(
        <<~HEREDOC
          2 imported box of chocolates at 3.49
          Sales Taxes: 0.35
          Total: 7.33
        HEREDOC
      ).to_stdout
    end
  end
end
