class Restaurant < ActiveRecord::Base
	belongs_to :owner
	validates_presence_of :name, :description, :phone, :owner_id
	validates_uniqueness_of :name
	has_many :reservations, dependent: :destroy
##	validates :phone, format: { with: /\d{3}-\d{3}-\d{4}/, message: "invalid phone number"}
end
