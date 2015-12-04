class ReservationsController < ApplicationController

	def create
		@restaurant = Restaurant.find(params[:restaurant_id])
		@reservation = Reservation.new(reservation_params)
		@reservation.restaurant = @restaurant
		if @reservation.save
			redirect_to restaurants_path, notice: 'Successful reservation!'
		else
			@restaurant = Restaurant.find(params[:restaurant_id])
			render 'restaurants/show', status: 500
		end
	end

	def show
		@restaurant = Restaurant.find(params[:restaurant_id])
		@reservation = Reservation.find(params[:id])
	end

	def destroy
		@restaurant = Restaurant.find(params[:restaurant_id])
		@reservation = Reservation.find(params[:id])
		@reservation.destroy
		redirect_to @restaurant
	end

	private
	def reservation_params
		params.require(:reservation).permit(:id, :email, :time, :message)
	end
end
