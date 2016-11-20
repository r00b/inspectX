
class Mechanic < ActiveRecord::Base
  belongs_to :user
  has_many :inspections

  accepts_nested_attributes_for :user

  has_attached_file :picture, styles: { medium: "420x450>", thumb: '150x150>' }
  validates_attachment :picture, content_type: { content_type: /\Aimage\/.*\Z/ }

  def self.approved
    where(approved: true).order("created_at DESC").select {|m| m.user.role == 1}
  end

  def self.unapproved
    where(approved: false).order("created_at DESC").select {|m| m.user.role == 1}
  end

  def has_mechanic_user?
    self.user.mechanic?
  end

  def self.search(search)
    where("speciality ILIKE ? OR zip ILIKE ?", "%#{search}%", "%#{search}%")
  end

end
