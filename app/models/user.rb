module User
  FULL_LANGUAGES = {'en' => 'English', 'ar' => ' Arabic', 'zh' => 'Chinese', 'nl' => 'Dutch', 'fr' => 'French', 'de' => 'German', 'he' => 'Hebrew', 'hi' => 'Hindi', 'it' => 'Italian', 'ja' => 'Japanese', 'ko' => 'Korean', 'pt' => 'Portuguese', 'ru' => 'Russian', 'es' => 'Spanish', 'ur' => 'Urdu'}

  extend ActiveSupport::Concern
  included do
    include AccountHolder
  end

  def upcoming_sessions
    counseling_sessions.where('start_datetime > ?', Time.now - 3.days).order(:start_datetime)
  end

  def previous_sessions
    counseling_sessions.where('start_datetime <= ?', Time.now - 3.days).order(:start_datetime).reverse
  end

  def name
    [first_name, last_name].compact.join(' ')
  end
end
