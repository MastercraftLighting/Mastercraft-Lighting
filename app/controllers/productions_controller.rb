class ProductionsController < ApplicationController
  before_action :set_production, only: [:show, :update, :destroy]

  def index
    authenticate_user!
    case current_user.user_type
      when "Administrator"
        @productions = Production.all
      when "Designer"
        @productions = current_user.designed_productions
      when "ME"
        @productions = current_user.master_electrician_productions
      when "Lead"
        @productions = current_user.lead_productions
    end

    render :index
  end

  def create

  end

  def new
    @production = Production.new(params)
    if @production.save
      redirect_to :new
    else
      redirect_to :index
    end
  end

  def edit

  end

  def show
    @equipment = @production.equipment.sort_by &:channel
    render :new
  end

  def update

  end

  def destroy
    production = Production.find(params[:id])
    production.destroy
    redirect_to productions_path
  end

  private

    def set_production
      @production = Production.find(params[:id])
    end

end
