class Meal < ActiveRecord::Base
  belongs_to :customer
  has_many :persons
end
