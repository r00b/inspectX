class Mechanic < ActiveRecord::Base
  belongs_to :user
  has_many :inspections

  def approve
  	self.approved = true
  end

end
  def self.search(search)
    where("name LIKE ? OR ingredients LIKE ? OR cooking_instructions LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%") 
  end