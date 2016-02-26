class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :logged_in?
  before_filter :current_user
  before_filter :configure_permitted_parameters, if: :devise_controller?

  def current_user
    if session['warden.user.user.key']
      @current_user ||= User.find_by_id(session['warden.user.user.key'][0][0])
    end
  end

  def logged_in?
    !current_user.nil?
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) {
        |u| u.permit(
          :email, :last_name, :first_name, :pseudo,
          :avatar, :country, :password, :password_confirmation)
    }
  end
end
