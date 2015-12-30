class User < ActiveRecord::Base
  has_secure_password

  has_many :api_tokens

  validates :email, :password, presence: true
  validates :email, uniqueness: true

  def last_valid_token
    ApiToken.last_valid(self)
  end

  def create_token
    ApiToken.create_ephemeral_token(self)
  end
end
