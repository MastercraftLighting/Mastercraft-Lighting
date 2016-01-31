class AdminsController < ApplicationController
  before_action :check_admin

  def index
    @users = User.all
    @usertypes = Usertype.all
  end

  def show
    user = User.find(params[:id])
    puts user.inspect
    @productions = user.designed_productions if user.user_type == "Designer"
    @productions = user.lead_productions if user.user_type == "Lead"
    # @productions = user.master_electrician_productions if user.user_type == "ME"
    # above method not currently working.....
    puts @productions
    render "productions/index"
  end

  def update
    user = User.find(params[:id])
    user.user_type = "Administrator"
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
