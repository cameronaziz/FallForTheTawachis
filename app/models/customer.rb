class Customer < ActiveRecord::Base
  has_many :reservations
  has_many :invitees
  has_many :companions
  has_many :meals
end
