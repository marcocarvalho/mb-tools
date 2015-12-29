class TradePolicy < ApplicationPolicy
  alias_method :create?, :api_token?
  alias_method :last_tid?, :api_token?
end