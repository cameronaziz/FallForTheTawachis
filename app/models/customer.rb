class Customer < ActiveRecord::Base
  has_many :reservations
  has_many :persons, through: :reservations
  has_many :meals
  has_many :users
  has_many :email_configurations
  has_many :email_templates, through: :email_configurations

  validates :name, presence: true
  validates :from_email, presence: true

end