class SessionsMailer < ActionMailer::Base
  default from: "iCouch <noreply@icouch.me>"

  def counselor_question(question)
    @question = question
    mail(
      to: question.counselor.email,
      cc: 'iCouch <ask_a_question@icouch.me>',
      bcc: 'dropbox@77205966.icouchinc.highrisehq.com',
      subject: "iCouch: #{question.client.name} has a question."
    )
  end

  def client_question(question)
    @question = question
    mail(
      to: question.client.email,
      subject: "iCouch: Here's a copy of your question for #{session.counselor.name}!"
    )
  end

end
