class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
    	t.string :email
    	t.datetime :time
    	t.string :message

      	t.timestamps null: false
    end
  add_reference :reservations, :restaurant, index: true, foreign_key: true
  end
end
