class Restaurant < ActiveRecord::Base
  attr_accessible :address, :image, :name, :owner_id, :phone_number, :website_url

  validates :name, :address, :phone_number, presence: :true
	validates :owner_id, presence: true
  belongs_to :owner
  mount_uploader :image, ImageUploader
end
