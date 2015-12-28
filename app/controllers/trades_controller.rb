class TradesController < ApplicationController
  def create
  end

  def last_tid
    render json: { tid: _last_tid.tid }
  end

  private

  def parsed_trade_params
    trade_params[:kind] ||= trade_params.delete(:type)
    trade_params
  end

  def trade_params
    params.permit(:date, :tid, :amount, :type, :kind, :price)
  end

  def _last_tid
    @_last_tid ||= Trade.last_tid
  end
end
