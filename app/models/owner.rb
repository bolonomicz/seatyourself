class Owner < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
  has_secure_password
  validates_presence_of :password, on: :create

  has_many :restaurants, dependent: :destroy
end
