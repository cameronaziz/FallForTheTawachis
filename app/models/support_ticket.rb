class SupportTicket < ActiveRecord::Base
  has_many :support_comments
  belongs_to :user, class_name:'User', foreign_key: :created_by
  belongs_to :customer

  accepts_nested_attributes_for :support_comments, allow_destroy: true

end
