class Restaurant < ActiveRecord::Base
	belongs_to :user
	validates_presence_of :name, :description, :phone, :user_id
	validates_uniqueness_of :name
	has_many :reservations, dependent: :destroy
	accepts_nested_attributes_for :reservations
	has_and_belongs_to_many :categories, join_table: "categories_restaurants"
##	validates :phone, format: { with: /\d{3}-\d{3}-\d{4}/, message: "invalid phone number"}
end
