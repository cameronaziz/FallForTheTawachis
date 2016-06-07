class Layout < ActiveRecord::Base
  has_many :configurations
  has_many :customers, through: :configurations
end
