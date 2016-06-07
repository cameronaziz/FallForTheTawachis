class Customer < ActiveRecord::Base
  has_many :reservations
  has_many :persons, through: :reservations
  has_many :meals
  has_many :users
  has_many :configurations
  has_many :layouts, through: :configurations
end