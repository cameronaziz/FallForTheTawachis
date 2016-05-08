class Invitee < ActiveRecord::Base
  has_one :companion
  belongs_to :customer
  belongs_to :reservation
  belongs_to :meal

  def name=(name)
    split = name.split(' ', 2)
    self.first_name = split.first
    self.last_name = split.last
  end

end
