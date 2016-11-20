class InspectionMailer < BaseMailer
  def send_inspection_to_user(inspection)
    @inspection = inspection
    mail(to: @inspection.user.email, subject: 'inspectX Inspection Confirmation')
  end

  def send_inspection_to_admin(inspection)
    @inspection = inspection
    mail(to: admin, subject: 'New inspectX Inspection')
  end
end
