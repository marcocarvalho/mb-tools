class ApplicationController < ActionController::Base
  include Pundit
  after_action :verify_authorized, except: [:auth]

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def auth
    if user_for_authentication
      render json: { token: token_for(user_for_authentication).token }
    else
      user_not_authorized
    end 
  end

  protected

  def current_user
    params[:token]
  end

  private

  def token_for(user)
    user.last_valid_token || user.create_token
  end

  def user_for_authentication
    @user_for_authentication ||= 
      User
        .find_by(email: params[:email])
        .try(:authenticate, params[:password])
  end

  def user_not_authorized
    render json: { messages: ['not authorized'] }, status: 403
  end
end
