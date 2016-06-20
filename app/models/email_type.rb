class EmailType < ActiveRecord::Base
  has_many :email_template
end
