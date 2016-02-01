class UsersController < ApplicationController
  before_action except: [:show] do
    redirect_to :root unless admin?
  end

  def index
    @users = User.all
  end

  def show
    @user = current_user
  end

end
