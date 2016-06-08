class EmailTemplate < ActiveRecord::Base
  belongs_to :email_configuration
  belongs_to :customer
end
