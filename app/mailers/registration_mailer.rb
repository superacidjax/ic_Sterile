class RegistrationMailer < ActionMailer::Base
  default from: "iCouch <noreply@icouch.me>"

  def counselor_submission(counselor)
    @counselor = counselor
    mail(
      to: Account.admin_emails,
      bcc: 'superacidjax@me.com',
      subject: "#{counselor.name} is ready for vetting"
    )
  end

  def rejection_notification(counselor)
    @counselor = counselor
    mail(
      to: counselor.email,
      bcc: 'superacidjax@me.com',
      subject: "Your iCouch approval status"
    )
  end

  def approval_notification(counselor)
    @counselor = counselor
    mail(
      to: counselor.email,
      bcc: 'superacidjax@me.com',
      subject: "Congratulations and Welcome to iCouch!"
    )
  end

end
