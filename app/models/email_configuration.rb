class EmailConfiguration < ActiveRecord::Base
  has_many :email_templates
  has_many :customers, through: :email_templates
end
