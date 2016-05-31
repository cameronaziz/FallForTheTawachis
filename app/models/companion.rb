class Companion < ActiveRecord::Base
  belongs_to :person
  belongs_to :customer
  belongs_to :reservation

  def full_name
    "#{self.person.first_name} #{self.person.last_name}"
  end

end
