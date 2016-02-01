class WelcomeController < ApplicationController
	def index
    @production = Production.new(designer_id: current_user.id)

	end
end
