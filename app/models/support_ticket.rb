class SupportTicket < ActiveRecord::Base
  has_many :support_comments
  belongs_to :user, foreign_key: :created_by
  belongs_to :customer

end
