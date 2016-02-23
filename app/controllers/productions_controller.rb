class ProductionsController < ApplicationController
  before_action :set_production, only: [:show, :update, :destroy, :print]
  before_action :set_productions
  before_action :set_venues

include ProductionsHelper

  def index
    p flash.alert
    p params
    authenticate_user!
    set_productions
    render :index
  end

  def create
    set_productions
    # if Venue.find(params[:production][:venues])
    # @venue = Venue.find(params[:production][:venues])
    # end
    if User.find_by_username(params[:production][:master_electrician_id])
    @production = Production.new(name: params[:production][:name], date: params[:production][:date], designer_id: current_user.id, master_electrician_id: User.find_by_username(params[:production][:master_electrician_id]).id)
    else
      @production = Production.new(name: params[:production][:name], date: params[:production][:date], designer_id: current_user.id)
    end

    if @production.save
      render :index
    else
      redirect_to :root
    end

  end

  def new
    @production = Production.new(designer_id: current_user.id)
    render '_new_form', layout: false
  end

  def edit
    @production = Production.find(params[:id])
  end

  # Change the logic here so that if equipment records lack channel info this will still order the data in a sensible way
  def show
    @colors = ColorLibrary.all
    @equipment_sorted_sliced_for_channel_view = equipment_sorted_sliced_for_channel_view
    @equipment_sorted_sliced_for_circuit_view = equipment_sorted_sliced_for_circuit_view
    @equipment_sorted_sliced_for_color_view = equipment_sorted_sliced_for_color_view
    @equipment_sorted_sliced_for_dimmer_view = equipment_sorted_sliced_for_dimmer_view
    @equipment_sorted_sliced_for_instrument_view = equipment_sorted_sliced_for_instrument_view
    render :show
  end

  def update
    case current_user.user_type.name
      when "Administrator"
        if @production.update_attributes(production_params)
        render "index", layout: false
        end
      when "Designer"
        if @production.update_attributes(production_params)
        render "index", layout: false
        end
      when "ME"
        render "index", layout: false
      when "Lead"
        render "index", layout: false
      end
  end

  def destroy
    case current_user.user_type.name
      when "Administrator"
      production = Production.find(params[:id])
      production.destroy
      when "Designer"
      production = Production.find(params[:id])
      production.destroy
      when "ME"
        production = Production.find(params[:id])
        production.master_electrician_id = nil
        production.save
      when "Lead"
        production = Production.find(params[:id])
        production.master_electrician_id = nil
        production.save
      end
    redirect_to productions_path
  end


  def print
  	@production = Production.find(params[:id])
    @colors = ColorLibrary.all
    @equipment_sorted_sliced_for_channel_view = equipment_sorted_sliced_for_channel_view
    @equipment_sorted_sliced_for_circuit_view = equipment_sorted_sliced_for_circuit_view
    @equipment_sorted_sliced_for_color_view = equipment_sorted_sliced_for_color_view
    @equipment_sorted_sliced_for_dimmer_view = equipment_sorted_sliced_for_dimmer_view
    @equipment_sorted_sliced_for_instrument_view = equipment_sorted_sliced_for_instrument_view
    respond_to do |format|
      format.html
      format.pdf do
        render :pdf => "print_views", :template => "print.html.erb", :header => { :spacing => 10 }
      end
    end
  end


  private

    def set_venues
      @venues = Venue.all
    end

   def set_production
    if params[:id]
      @production = Production.find(params[:id])
  	else
  		@production = Production.find(params[:production_id])
  	end
   end
    def set_productions
      case current_user.user_type.name
      when "Administrator"
        @productions = Production.all
      when "Designer"
        @productions = current_user.designed_productions.count > 0 ? current_user.designed_productions : current_user.master_electrician_productions
      when "ME"
        @productions = current_user.master_electrician_productions
      when "Lead"
        @productions = current_user.lead_productions
    end
    end

    def production_params
      params.require(:production).permit(:name, :date)
    end
end
