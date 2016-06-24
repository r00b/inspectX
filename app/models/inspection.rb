class Inspection < ActiveRecord::Base
  belongs_to :user
  belongs_to :mechanic

  attr_accessor :card_number, :card_year, :card_month, :card_cvv

  validates :user_id, presence: true
  validates :mechanic_id, presence: true
  validates :location, presence: true
  validates :vehicle_year, presence: true
  validates :vehicle_make, presence: true
  validates :vehicle_model, presence: true
  validates :your_name, presence: true
  validates :your_address, presence: true
  validates :your_phone, presence: true
  validates :your_email, presence: true, email: true
  validates :seller_name, presence: true
  validates :seller_address, presence: true
  validates :seller_phone, presence: true
  validates :seller_email, presence: true, email: true
  validates :card_number, presence: true, credit_card_number: true
  validates :card_year, presence: true, numericality: true, length: { is: 4 }
  validates :card_month, presence: true, numericality: true, length: { is: 2 }
  validates :card_cvv, presence: true, numericality: true, length: { minimum: 3, maximum: 4 }

  after_validation :set_card_number_errors
  after_create :send_letter

  private 

  def send_letter
    InspectionMailer.send_inspection_to_user(self).deliver
    InspectionMailer.send_inspection_to_admin(self).deliver
  end

  handle_asynchronously :send_letter

  def set_card_number_errors
    errors.add(:card_number, "Card year #{errors[:card_year].first}") if errors[:card_year].any?
    errors.add(:card_number, "Card month #{errors[:card_month].first}") if errors[:card_month].any?
    errors.add(:card_number, "CVV #{errors[:card_cvv].first}") if errors[:card_cvv].any?
  end
end
