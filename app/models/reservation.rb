class Reservation < ActiveRecord::Base
  attr_accessible :customer_id, :restaurant_id, :time_slot
end
