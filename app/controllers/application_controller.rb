class ApplicationController < ActionController::Base
  include Pundit
  after_action :verify_authorized
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def current_user
    params[:token]
  end

  private

  def user_not_authorized
    render json: { messages: ['not authorized'] }, status: 403
  end
end
