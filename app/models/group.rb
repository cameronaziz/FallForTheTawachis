class Group < ActiveRecord::Base
  has_many :reservations
  belongs_to :customer
end
