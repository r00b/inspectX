class Mechanic < ActiveRecord::Base
  belongs_to :user
  has_many :inspections

  has_attached_file :picture, styles: { medium: "420x450>", thumb: '150x150>' }
  validates_attachment :picture, content_type: { content_type: /\Aimage\/.*\Z/ }

  def approve
  	self.approved = true
  end

  def self.search(search)
    where("speciality LIKE ? OR zip LIKE ?", "%#{search}%", "%#{search}%")
  end

end