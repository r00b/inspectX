class Mechanic < ActiveRecord::Base
  belongs_to :user
  has_many :inspections

  def approve
  	self.approved = true
  end

end
