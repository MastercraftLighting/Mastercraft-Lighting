class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

helper_method :admin?
helper_method :check_admin

private

  def check_admin
    redirect_to :root unless admin?
  end

  def admin?
    if current_user && current_user.user_type == "Administrator"
        return true
    else
      return false
    end
  end

end
