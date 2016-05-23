class Mechanic < ActiveRecord::Base
  belongs_to :user
  has_many :inspections

  def approve
  	self.approved = true
  end

  def self.search(search)
    where("speciality LIKE ? OR zip LIKE ?", "%#{search}%", "%#{search}%")
  end

end