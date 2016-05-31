class Invitee < ActiveRecord::Base
  belongs_to :person
  belongs_to :customer
  belongs_to :reservation

  def name=(name)
    split = name.split(' ', 2)
    self.first_name = split.first
    self.last_name = split.last
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

end
