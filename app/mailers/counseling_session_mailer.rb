class CounselingSessionMailer < ActionMailer::Base
  default from: "iCouch <noreply@icouch.me>"

  def counselor_new_session_notification(counseling_session)
    @counseling_session = counseling_session
    mail(
      to: counseling_session.counselor.email,
      cc: 'iCouch <sessions@icouch.me>',
      bcc: 'superacidjax@me.com',
      subject: "#{counseling_session.client.name} has booked an iCouch session with you"
    )
  end

  def client_new_session_notification(counseling_session)
    @counseling_session = counseling_session
    mail(
      to: counseling_session.client.email,
      bcc: 'superacidjax@me.com',
      subject: "Enjoy your iCouch session with #{counseling_session.counselor.name}!"
    )
  end

end
