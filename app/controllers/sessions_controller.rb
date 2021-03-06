class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    @user = @user.try(:authenticate, params[:user][:password])
    if !@user 
      redirect_to controller: 'sessions', action: 'new'
    else 
      session[:user_id] = @user.id
      redirect_to controller: 'welcome', action: 'home'
    end
  end

  def destroy 
    session.delete :user_id 
    redirect_to '/'
  end
end
  