class SessionsController < ApplicationController
  before_action :logged_in_redirect, except: [:destroy]

  def create
    @user = User.find_by( session_params( :username ) )
    if @user.authenticate( params.require( :password ) )
      session[:user_id] = @user.id
      redirect_to guests_path
    else
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to '/'
  end

  private

  def session_params( *args )
    params.permit( *args )
  end
end
