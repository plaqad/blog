class ApplicationController < ActionController::API
  include ActionController::MimeResponds
  include ActionController::Cookies

  def authenticate_user!
    unless current_user
      render json: { error: 'You need to sign in' }, status: :unauthorized
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
end
