class BaseMailer < ActionMailer::Base
  default from: 'shawn@series5technology.com'
  layout 'mailer'

  def admin
    'frank@inspect-x.com'
  end
end
