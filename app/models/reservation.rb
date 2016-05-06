class Reservation < ActiveRecord::Base
  has_one :companion
  has_one :invitee
  belongs_to :customer
end
