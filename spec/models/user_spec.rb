require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to validate_presence_of :email }
  it { is_expected.to validate_presence_of :password }

  context 'uniqueness' do
    subject { create(:user) }
    it { is_expected.to validate_uniqueness_of :email }
  end

  it { is_expected.to have_many :api_tokens }
end
