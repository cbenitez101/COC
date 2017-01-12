class MenuController < ApplicationController
	def index
		if current_user
			@rol = User.find(current_user.id).rol
			if @rol == 0
				@dishes = Dish.all
			else
				@dishes = Dish.active()
			end
		else	
		 	@dishes = Dish.active()	
		end
  end
end
