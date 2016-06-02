class Person < ActiveRecord::Base
  belongs_to :reservation
  belongs_to :meal

  validates :first_name, presence: true
  validates :last_name, presence: true

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

end
