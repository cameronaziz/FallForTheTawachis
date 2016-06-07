class Configuration < ActiveRecord::Base
  belongs_to :customer
  belongs_to :layout
end
