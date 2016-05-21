class User < ActiveRecord::Base
  has_many :inspections
  has_one :mechanic
  #test it
  enum role: [:customer, :mechanic, :admin]
  
  # after_initialize :set_default_user_type, :if => :new_record?

  # def set_default_type
  #   self.user_type ||= :customer
  # end

  def has_role?(role)
    self.role == role
  end

  def admin?
    has_role?(:admin)
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, 
         :recoverable, :rememberable, :trackable, :validatable
         #:confirmable,

  # def send_on_create_confirmation_instructions
  #   #send_devise_notification(:confirmation_instructions)
  # end
end
