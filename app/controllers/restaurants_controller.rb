class RestaurantsController < ApplicationController
	before_action :authenticate_user!, :except => [:index, :show]
	def index
		@restaurants = Restaurant.all
	end

	def show
		@restaurant = Restaurant.find(params[:id])
		@restaurant.reservations.build
	end


	def new
		if current_user.owner?
			@restaurant = current_user.restaurants.build
		else
			redirect_to restaurants_path, notice: 'You do not have permission.', status: 403
		end
	end

	def create
		@restaurant = current_user.restaurants.build(restaurant_params)
		if @restaurant.save
			redirect_to @restaurant, notice: 'Restaurant was successfully created.'
		else
			render action: "new"
		end
	end

	def edit
		@restaurant = current_user.restaurants.find(params[:id])
	end

	def update
		@restaurant = current_user.restaurants.find(params[:id])
		if @restaurant.update_attributes(restaurant_params)
			redirect_to @restaurant, notice: 'Restaurant was successfully updated.'
		else
			render action: "edit"
		end
	end

	def destroy
		@restaurant = current_user.restaurants.find(params[:id])
		@restaurant.destroy
		redirect_to restaurants_path
	end

	private
	def restaurant_params
		params.require(:restaurant).permit(:id, :address, :description, :name, :phone,
			{category_ids: [] })
	end
end
