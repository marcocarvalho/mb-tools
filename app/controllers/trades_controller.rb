class TradesController < ApplicationController
  def last_tid
    render json: { tid: _last_tid.tid }
  end

  private

  def _last_tid
    @_last_tid ||= Trade.last_tid
  end
end
