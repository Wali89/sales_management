class SessionsController < ApplicationController
  skip_before_action :verify_user_is_authenticated, only: [:new,:create]

  def new
    @user = User.new
  end

  def create
    if auth_hash = request.env["omniauth.auth"]
      oauth_email = request.env["omniauth.auth"]["email"]
      if user = User.find_by(:email => oauth_email)
        session[:user_id] = user.id
      else
        user = User.create(:email => oauth_email)
      end
      
    else
      user = User.find_by(name:params[:user][:name])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to user_path(user)
      else
        render 'new'
      end
    end

  end

  def destroy
    session.delete("user_id")
    redirect_to root_path
  end

  private
 
  def auth
    request.env['omniauth.auth']
  end

end