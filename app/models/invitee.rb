class Invitee < ActiveRecord::Base
  has_one :companion
  belongs_to :customer
  belongs_to :reservation
  belongs_to :meal
end
