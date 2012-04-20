class CounselingSession < ActiveRecord::Base

  belongs_to :counselor
  belongs_to :client

  if Rails.env.production?
    after_create :send_notification_emails
  end

  def send_notification_emails
    CounselingSessionMailer.counselor_new_session_notification(self).deliver
    CounselingSessionMailer.client_new_session_notification(self).deliver
  end

  def start_datetime=(value)
    write_attribute(:start_datetime, value)
    write_attribute(:end_datetime, start_datetime + Counselor::DEFAULT_COUNSELING_SESSION_MINUTES.minutes)
  end

end
