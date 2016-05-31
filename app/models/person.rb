class Person < ActiveRecord::Base
  belongs_to :reservation
  belongs_to :meal
  belongs_to :group

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

end
