class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :logged_in_redirect, :logged_out_redirect

  private

  def logged_out_redirect
    unless session[:user_id]
      redirect_to :login
    end
  end

  def logged_in_redirect
    if session[:user_id]
      redirect_to guests_path
    end
  end

end
