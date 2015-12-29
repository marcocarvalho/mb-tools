class User < ActiveRecord::Base
  has_many :api_tokens

  validates :email, :password, presence: true
  validates :email, uniqueness: true
end
