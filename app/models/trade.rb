class Trade < ActiveRecord::Base
  validates :tid, uniqueness: true

  scope :tid_order, -> { order(:tid) }
  scope :last_tid, -> { tid_order.last }

  validates :date, :tid, :kind, :amount, :price, presence: true
  validates :tid, numericality: { only_integer: true }
  validates :amount, :price, numericality: true
  validates :kind, inclusion: { in: ['buy', 'sell'] }
end
