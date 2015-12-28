class Trade < ActiveRecord::Base
  enum kind: [:buy, :sell]

  validates :tid, uniqueness: true
end
