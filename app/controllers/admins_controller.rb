class AdminsController < ApplicationController
  before_action :check_admin

  def index
    @users = User.all
  end

  def show
    user = User.find(params[:id])
    @productions = user.productions
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to admins_path
  end

  private

end
