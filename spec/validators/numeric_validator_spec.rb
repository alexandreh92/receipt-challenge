require 'spec_helper'

RSpec.describe Validators::NumericValidator do
  subject(:validator) { described_class }

  describe '#valid?' do
    context 'when value is valid' do
      let(:value) { '1.5' }

      it 'returns true' do
        expect(validator.valid?(value)).to be_truthy
      end
    end

    context 'when value is invalid' do
      let(:value) { 'something' }

      it 'returns false' do
        expect(validator.valid?(value)).not_to be_truthy
      end
    end
  end
end
