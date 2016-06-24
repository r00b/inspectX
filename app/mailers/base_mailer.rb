class BaseMailer < ActionMailer::Base
  default from: 'shawn@series5technology.com'
  layout 'mailer'

  def admin
    'shawn@series5technology.com'
  end
end
