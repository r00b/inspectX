class BaseMailer < ActionMailer::Base
  default from: 'noreply@inspect-x.com'
  layout 'mailer'

  def admin
    'frank@inspect-x.com'
  end
end
