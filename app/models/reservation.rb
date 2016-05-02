class Reservation < ActiveRecord::Base
  has_many :guests
end
