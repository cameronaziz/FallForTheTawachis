class Group < ActiveRecord::Base
  has_many :persons
  belongs_to :customer
end
