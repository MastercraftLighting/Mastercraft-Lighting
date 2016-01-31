class ProductionsController < ApplicationController
	def index
	end

	def new
		@production = Production.new(params)
		if @production.save
			redirect_to :new
		else
			redirect_to :index
	end
end
