class ProductionsController < ApplicationController
  before_action :set_production, only: [:show, :update, :destroy]

  def index
    @productions = Production.all
    @productions = current_user.productions unless admin?
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
  end

  private

    def set_production
      @production = Production.find(params[:id])
    end

end
