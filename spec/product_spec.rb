require 'spec_helper'

RSpec.describe Product do
  subject(:product) { described_class.new(amount: amount, name: name, price: price) }

  let(:amount) { '01' }
  let(:name) { 'my product' }
  let(:price) { '12.46' }

  describe '#valid?' do
    context 'when valid' do
      it 'returns true' do
        expect(product).to be_valid
      end
    end

    context 'when invalid' do
      context 'when amount is not a number' do
        let(:amount) { 'foo' }

        it 'returns false' do
          expect(product).not_to be_valid
        end
      end

      context 'when name is not a string' do
        let(:name) { nil }

        it 'returns false' do
          expect(product).not_to be_valid
        end
      end

      context 'when price is not a number' do
        let(:price) { 'foo' }

        it 'returns false' do
          expect(product).not_to be_valid
        end
      end
    end
  end

  describe '#imported?' do
    context 'when is a imported product' do
      let(:name) { 'imported tomato' }

      it 'returns true' do
        expect(product).to be_imported
      end
    end

    context 'when is not a imported product' do
      let(:name) { 'just a tomato' }

      it 'returns false' do
        expect(product).not_to be_imported
      end
    end
  end

  describe '#tax_free?' do
    context 'when product is basic tax free' do
      context 'when product is food' do
        let(:name) { 'chocolate drops' }

        it 'returns true' do
          expect(product).to be_tax_free
        end
      end

      context 'when product is a book' do
        let(:name) { 'the lord of the rings book' }

        it 'returns true' do
          expect(product).to be_tax_free
        end
      end

      context 'when product is medicine' do
        let(:name) { 'sugar pills' }

        it 'returns true' do
          expect(product).to be_tax_free
        end
      end
    end

    context 'when product is not tax free' do
      let(:name) { 'narsil sword' }

      it 'returns true' do
        expect(product).not_to be_tax_free
      end
    end
  end

  describe '#tax' do
    let(:price) { '10' }

    context 'when is imported' do
      context 'when the product is taxed by basic taxes' do
        let(:name) { 'imported narsil sword' }

        it 'returns sum of the both taxes' do
          expect(product.tax).to eq(1.5)
        end
      end

      context 'when the product is not taxed by basic taxes' do
        let(:name) { 'imported chocolates' }

        it 'applies only import tax' do
          expect(product.tax).to eq(0.5)
        end
      end
    end

    context 'when the product is not imported' do
      context 'when the product is not tax free' do
        let(:name) { 'narsil sword' }

        it 'applies only basic tax' do
          expect(product.tax).to eq(1.0)
        end
      end

      context 'when the product is tax free' do
        let(:name) { 'box of chocolates' }

        it 'does not apply taxes' do
          expect(product.tax).to eq(0)
        end
      end
    end
  end
end
