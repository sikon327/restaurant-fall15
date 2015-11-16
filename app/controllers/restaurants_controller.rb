class RestaurantsController < ApplicationController
	before_action :authenticate_owner!, :except => [:index, :show]
	def index
		@restaurants = Restaurant.all
	end

	def show
		@restaurant = Restaurant.find(params[:id])
	end

	def new
		@restaurant = current_owner.restaurants.build
	end

	def create
		@restaurant = current_owner.restaurants.build(restaurant_params)
		if @restaurant.save
			redirect_to @restaurant, notice: 'Restaurant was successfully created.'
		else
			render action: "new"
		end
	end

	def edit
		@restaurant = current_owner.restaurants.find(params[:id])
	end

	def update
		@restaurant = current_owner.restaurants.find(params[:id])
		if @restaurant.update_attributes(restaurant_params)
			redirect_to @restaurant, notice: 'Restaurant was successfully updated.'
		else
			render action: "edit"
		end
	end

	def destroy
		@restaurant = current_owner.restaurants.find(params[:id])
		@restaurant.destroy
		redirect_to restaurants_path
	end

	private
	def restaurant_params
		params.require(:restaurant).permit(:id, :address, :description, :name, :phone)
	end
end
