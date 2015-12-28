class Trade < ActiveRecord::Base
  enum kind: [:buy, :sell]

  validates :tid, uniqueness: true

  scope :tid_order, -> { order(:tid) }
  scope :last_tid, -> { tid_order.last }
end
