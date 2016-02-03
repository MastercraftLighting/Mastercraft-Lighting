class UsersController < ApplicationController
  before_action except: [:show] do
    redirect_to "/users/#{:user_id}" unless admin?
  end


  def index
    @users = User.all
  end


  def show
    @user = current_user
    render :show
  end

  def view_only?
    !(current_user.user_type.name == "Administrator" || current_user.user_type.name == "Designer")
  end
  helper_method :view_only?

end
