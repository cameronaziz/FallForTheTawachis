class Reservation < ActiveRecord::Base
  has_one :companion
  has_one :invitee
  belongs_to :customer

  def registration_time
    format = '%m/%d/%Y %H:%M'
    created_at.strftime(format)
  end


end
