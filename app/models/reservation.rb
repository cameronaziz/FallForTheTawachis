class Reservation < ActiveRecord::Base
  belongs_to :customer
  has_many :persons, dependent: :destroy
  accepts_nested_attributes_for :persons, reject_if: lambda { |a| a[:first_name].blank? }, allow_destroy: true
  belongs_to :group

  before_save :clean_url

  validates :name, presence: true
  validates_uniqueness_of :custom_name, :scope => [:customer_id]


  def registration_time
    format = '%m/%d/%Y'
    created_at.strftime(format)
  end

  def clean_url
    self.custom_name.downcase!
    self.custom_name = self.custom_name.gsub(/\s+/, '')
  end

  def party_size_filter
    if self.party_size.nil?
      'Undefined'
    else
      self.party_size
    end
  end

  def associated_people
    people = 0
    self.persons.each do
      people = people + 1
    end
    people
  end

end
