class Companion < ActiveRecord::Base
  belongs_to :invitee
  belongs_to :customer
  belongs_to :reservation
  belongs_to :meal

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

end
