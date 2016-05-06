class Companion < ActiveRecord::Base
  belongs_to :invitee
  belongs_to :customer
  belongs_to :reservation
  belongs_to :meal
end
