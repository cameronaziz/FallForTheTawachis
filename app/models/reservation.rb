class Reservation < ActiveRecord::Base
  has_one :companion
  has_one :invitee
  belongs_to :customer
  accepts_nested_attributes_for :invitee
  accepts_nested_attributes_for :companion

  def registration_time
    format = '%m/%d/%Y %H:%M'
    created_at.strftime(format)
  end

  def party_size_filter
    if self.party_size.nil?
      'Undefined'
    else
      self.party_size
    end
  end


end
