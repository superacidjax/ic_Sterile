class Client < ActiveRecord::Base
  include User
  include Availability

  mount_uploader :avatar, AvatarUploader

  has_many :counselors, through: :counseling_sessions, uniq: true
  has_many :concerns
  has_many :issues, through: :concerns
  has_many :counseling_sessions
  has_many :payment_notifications

  serialize :languages, Array
  serialize :religions, Array

  validates_presence_of :first_name, :last_name, :time_zone
  validates_presence_of :gender, :relationship_status, :employment_status, :education, if: :personal_information_required?

  validates_acceptance_of :emergency_contact_permitted, accept: true, if: :emergency_contact_required?
  validates_presence_of :emergency_contact_name, :emergency_contact_phone_number, :emergency_contact_relationship, if: :emergency_contact_required?

  
  validates_inclusion_of :country, in: COUNTRIES.map(&:last), allow_blank: true


  attr_accessor :current_step

  def additional_information?
    emergency_contact_required? || [previously_counseled, currently_counseled, issues, other_issues, languages, other_languages, religions, other_religions].any? {|x| x == false || x.present? }
  end

  def age
    now = Time.now.utc.to_date
    now.year - birthday.year - ((now.month > birthday.month || (now.month == birthday.month && now.day >= birthday.day)) ? 0 : 1)
  end

  def emergency_contact_required?
    [emergency_contact_name, emergency_contact_phone_number, emergency_contact_relationship].any?(&:present?)
  end

  def personal_information?
    [gender, relationship_status, employment_status, education].all?
  end

  def personal_information_required?
    current_step == 'personal_information'
  end

  def location
    if us?
      "#{city}, #{state_or_province}"
    else
      "#{city}, #{country}"
    end
  end


  def create_initial_payment_info!(token, counselor)
    customer = Stripe::Customer.create(card: token, email: self.email)
    self.stripe_customer_id = customer.id

    Stripe::Charge.create(
      amount:      counselor.session_rate.cents,
      currency:    "usd",
      customer:    self.stripe_customer_id,
      description: "iCouch session with #{counselor.name}"
    )
  end

  private

  def us?
    country == 'US'
  end

end
