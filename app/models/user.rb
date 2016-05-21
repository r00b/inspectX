class User < ActiveRecord::Base
  has_many :inspections
  has_one :mechanic
  enum roles: [:customer, :mechanic, :admin]

  def has_role?(role)
    self.role == User.roles[role]
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
