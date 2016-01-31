class WelcomeController < ApplicationController
	def index
    @production = Production.new(designer_id = session[:user_id])

	end
end
