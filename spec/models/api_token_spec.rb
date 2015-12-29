require 'rails_helper'

RSpec.describe ApiToken, type: :model do
  it { is_expected.to validate_uniqueness_of :token }
end
