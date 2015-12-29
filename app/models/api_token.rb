class ApiToken < ActiveRecord::Base
  validates :token, uniqueness: true
end
