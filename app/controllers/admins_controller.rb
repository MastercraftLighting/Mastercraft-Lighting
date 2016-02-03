class AdminsController < ApplicationController
  before_action :check_admin

  def index
    @users = User.all
    @usertypes = User_type.all
  end

  def show
    user = User.find(params[:id])
    puts user.inspect
    @productions = user.designed_productions if user.user_type_id == 1
    @productions = user.lead_productions if user.user_type_id == 4
    # @productions = user.master_electrician_productions if user.user_type_id == 2
    # above method not currently working.....
    render "productions/index"
  end

  def update
    user = User.find(params[:id])
    user.user_type_id = 3
    user.save
    redirect_to admins_path
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to admins_path
  end

  private

end
