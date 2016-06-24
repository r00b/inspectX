class InspectionMailer < BaseMailer
  def send_inspection_to_user(inspection)
    @inspection = inspection
    mail(to: @inspection.user.email, subject: 'inspection create to user')
  end

  def send_inspection_to_admin(inspection)
    @inspection = inspection
    mail(to: admin, subject: 'inspection create admin')
  end
end
