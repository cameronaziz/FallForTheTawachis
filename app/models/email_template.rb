class EmailTemplate < ActiveRecord::Base
  has_many :email_configurations
  belongs_to :email_type
end
