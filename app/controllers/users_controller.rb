class UsersController < ApplicationController
  before_action :logged_in_redirect, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new( user_params )
    if @user.save
      session[:user_id] = @user.id
      redirect_to guests_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require( :user ).permit( :username, :password )
  end
end
