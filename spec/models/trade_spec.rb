require 'rails_helper'

RSpec.describe Trade, type: :model do
  context '#last_tid' do
    let!(:list) { create_list(:trade, 2) }
    it { expect(described_class.last_tid).to eq(list.last) }
  end

  describe '#validations' do
    it { is_expected.to validate_uniqueness_of(:tid) }

    # Shoulda::Matchers::ActiveModel::ValidateNumericalityOfMatcher::IneffectiveTestError:
    #   You are attempting to use validate_numericality_of, but the attribute
    #   you're testing, :price, is an float column. One of the things that the
    #   numericality matcher does is to assert that setting :price to a string
    #   that doesn't look like an float will cause your trade to become
    #   invalid. In this case, it's impossible to make this assertion since
    #   :price will typecast any incoming value to an float. This means that
    #   it's already guaranteed to be numeric! Since this matcher isn't doing
    #   anything, you can remove it from your model tests, and in fact, you can
    #   remove the validation from your model as it isn't doing anything
    #   either.

    it { should validate_inclusion_of(:kind).in_array(['sell', 'buy']) }

    it { is_expected.to validate_presence_of(:tid) }
    it { is_expected.to validate_presence_of(:date) }
    it { is_expected.to validate_presence_of(:amount) }
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_presence_of(:kind) }
  end
end
