class WelcomeController < ApplicationController
	def index
    @production = Production.new(designer_id: current_user.id) if current_user

	end
end
