class RestaurantsController < ApplicationController

	
	def new
		@restaurant = Restaurant.new
	end
	
	def index
		@restaurants = @restaurant.all
	end
	
	def create
		@restaurant = Restaurant.new(params[:restaurant])
		if @restaurant.save
			redirect_to restaurant_path(@restaurant)
		else
			render 'new'
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

	def destroy
		@restaurant = Restaurant.find(params[:id])
		@restaurant.destroy
		redirect_to restaurants_path, notice: "restaurant deleted"
	end
end
