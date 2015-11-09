class RestaurantsController < ApplicationController
       before_action :authenticate_owner!, except:[:index, :show]
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
			@restaurant.owner = current_owner.email
			redirect_to @restaurant, notice: 'Restaurant was successfully created.'
		else
			render action: "new"
		end
	end

	def edit
		@restaurant = Restaurant.find(params[:id])
		if @restaurant.owner != current_owner.email
			redirect_to restaurants_path, notice: 'You do not have permission'
		end
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
		if @restaurant.:owner == current_owner
			@restaurant.destroy
		end
		redirect_to restaurants_path
	end

	private
	def restaurant_params
		params.require(:restaurant).permit(:id, :address, :description, :name, :phone)
	end
end
