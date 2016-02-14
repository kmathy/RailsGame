class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :logged_in?
  before_filter :current_user

  def current_user
    if session['warden.user.user.key']
      @current_user ||= User.find_by_id(session['warden.user.user.key'][0][0])
    end
  end

  def logged_in?
    !current_user.nil?
  end
end
