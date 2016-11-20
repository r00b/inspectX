class BaseMailer < ActionMailer::Base
  default from: 'noreply@inspect-x.com'
  layout 'mailer'

  def admin
    'rsteilberg@gmail.com'
    # 'frank@inspect-x.com'
  end
end
