class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user
      session[:user_id] = user.id
      render json: { message: 'Logged in successfully' }
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end

  def destroy
    session[:user_id] = nil
    render json: { message: 'Logged out successfully' }
  end
end
