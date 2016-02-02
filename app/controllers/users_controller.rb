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

end
