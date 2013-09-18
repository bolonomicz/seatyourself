class Restaurant < ActiveRecord::Base
  attr_accessible :address, :image, :name, :owner_id, :phone_number, :website_url
end
