class Mechanic < ActiveRecord::Base
  belongs_to :user
  has_many :inspections
  #after_initialize :set_default_user_type, :if => :new_record?

  # def set_default_user_type
  #   self.user_type ||= :mechanic
  # end

end
