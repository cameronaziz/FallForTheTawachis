class EmailConfiguration < ActiveRecord::Base
  has_one :email_template
  has_one :customer
end