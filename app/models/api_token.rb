class ApiToken < ActiveRecord::Base
  belongs_to :user

  validates :token, uniqueness: true

  scope :valid, -> do
    order(:valid_until).where('valid_until > ?', Time.current)
  end

  def self.last_valid(user)
    valid.last
  end

  def self.create_ephemeral_token(user)
    create(user: user, token: SecureRandom.uuid, valid_until: 1.day.since)
  end

  def self.destroy_invalid
    where('valid_until <= ?', Time.current).destroy_all
  end
end
