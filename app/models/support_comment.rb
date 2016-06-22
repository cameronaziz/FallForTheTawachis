class SupportComment < ActiveRecord::Base
  belongs_to :support_ticket
  belongs_to :user
end
