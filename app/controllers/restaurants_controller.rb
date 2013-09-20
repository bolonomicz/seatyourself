class RestaurantsController < ApplicationController
	

	
	def new
		@restaurant = Restaurant.new
	end
	
	def index
		@restaurants = Restaurant.all
	end
	
	def create
		@restaurant = current_owner.restaurants.build(params[:restaurant])
		if @restaurant.save
			redirect_to restaurant_path(@restaurant)
		else
			render 'new'
		end
	end

	def show
		@restaurant = Restaurant.find(params[:id])
	end

	def edit
		@restaurant = Restaurant.find(params[:id])
	end

	def update
		@restaurant = Restaurant.find(params[:id])
		if @restaurant.update_attributes(params[:restaurant])
			redirect_to @restaurant
		else
			render 'edit'
		end
	end

	def destroy
		@restaurant = Restaurant.find(params[:id])
		@restaurant.destroy
		redirect_to restaurants_path, notice: "restaurant deleted"
	end

	
end
