require 'rails_helper'

RSpec.describe Trade, type: :model do
  it { is_expected.to validate_uniqueness_of(:tid) }
end
