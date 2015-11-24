class ReservationsController < ApplicationController
	def show
		@reservation = Reservation.find(params[:id])
	end

	def new
		@reservation = Reservation.new
	end

	def create
		byebug
		@restaurant = Restaurant.find(params[:restaurant_id])
		@reservation = Reservation.new(reservation_params)
		@reservation.restaurant = @restaurant
		byebug
		if @reservation.save
			redirect_to restaurants_path, notice: 'Successful reservation!'
		else
			@restaurant = Restaurant.find(params[:restaurant_id])
			render 'restaurants/show', status: 500
		end
	end

	private
	def reservation_params
		params.require(:reservation).permit(:id, :email, :time, :message)
	end
end
