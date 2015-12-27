class Trade < ActiveRecord::Base
  validates :tid, uniqueness: true
end
