class RestaurantsController < ApplicationController
	def index
		@restaurants = Restaurant.all
	end

	def show
		@restaurant = Restaurant.find(params[:id])
	end

	def new
		@restaurant = Restaurant.new
	end

	def create
		@restaurant = Restaurant.new(restaurant_params)
		if @restaurant.save
			redirect_to @restaurant, notice: 'Restaurant was successfully created.'
		else
			render action: "new"
		end
	end

	def edit
		@restaurant = Restaurant.find(params[:id])
	end

	def update
		@restaurant = Restaurant.find(params[:id])
		if @restaurant.update_attributes(restaurant_params)
			redirect_to @restaurant, notice: 'Restaurant was successfully updated.'
		else
			render action: "edit"
		end
	end

	def destroy
		@restaurant = Restaurant.find(params[:id])
		@restaurant.destroy
		redirect_to restaurants_path
	end

	private
	def restaurant_params
		params.require(:restaurant).permit(:id, :address, :description, :name, :phone)
	end
end
