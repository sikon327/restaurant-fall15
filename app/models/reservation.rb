class Reservation < ActiveRecord::Base
	belongs_to :restaurant
	validates_presence_of :email, :time
end
