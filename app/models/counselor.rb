require 'money'
require 'money/bank/google_currency'

class Counselor < ActiveRecord::Base
  include User
  include Availability

  attr_accessor :day_info

  extend FriendlyId
    friendly_id :name, use: :slugged,
                :sequence_separator => "-"

    def should_generate_new_friendly_id?
      new_record?
    end

  DEFAULT_COUNSELING_SESSION_MINUTES=60

  mount_uploader :avatar, AvatarUploader

  has_many :clients, through: :counseling_sessions, uniq: true
  has_many :days
  has_many :issues, through: :specialities
  has_many :counseling_sessions
  has_many :specialities

  validates_presence_of :country, :city, :postal_code
  validates_inclusion_of :country, in: COUNTRIES.map(&:last), allow_blank: true
  validates_inclusion_of :state_or_province, in: US_STATES, allow_blank: true, if: :us?
  validates_presence_of :state_or_province, if: :us?

  validates_presence_of :phone_number, :first_name, :last_name, :time_zone, :skype_id
  validates_presence_of :birthday, :gender, on: :update
  validates_inclusion_of :licensed, :license_suspended, in: [true, false], on: :update, message: :boolean
  validates_presence_of :employer_id_number, if: :us?, on: :update

  validates_presence_of :license_number, :licensing_authority, if: :licensed?

  validates_presence_of :license_suspension_authority, :license_suspension_date, if: :license_suspended?

  serialize :languages, Array
  serialize :religions, Array

  composed_of :session_rate,
    :class_name => "Money",
    :mapping => [%w(cents cents), %w(currency currency_as_string)],
    :constructor => Proc.new { |cents, currency| Money.new(cents || 9000, currency || Money.default_currency) },
    :converter => Proc.new { |value| value.respond_to?(:to_money) ? value.to_money : raise(ArgumentError, "Can't convert #{value.class} to Money") }

  scope :active, where(status: 'active')
  scope :has_entered_availability, where("days_count > 0")
  scope :deactivated, where(status: 'deactivated')
  scope :pending, where(status: 'pending')
  scope :rejected, where(status: 'rejected')
  scope :submitted, where(status: 'submitted')
  scope :speaks, lambda { |languages|
    languages.any? ? where("languages ILIKE '%#{languages.join("%' or languages ILIKE '%")}%'") : []
  }

  scope :old_search, ->(terms) do
    terms.split.inject(self) { |scope, term| scope.where("first_name ILIKE ? OR last_name ILIKE ?", "%#{term}%", "%#{term}%") }
  end

  state_machine :status, initial: :pending do
    event :submit do
      transition :pending => :submitted
    end

    event :approve do
      transition [:submitted, :pending, :rejected] => :active
    end

    event :reject do
      transition [:submitted, :pending] => :rejected
    end

    event :deactivate do
      transition :active => :deactivated
    end

    event :reactivate do
      transition :deactivated => :active
    end

    after_transition on: :submit do |counselor, transition|
      counselor.alert_admins_of_submission
    end

    after_transition on: :reject do |counselor, transition|
      RegistrationMailer.rejection_notification(counselor).deliver
    end

    after_transition on: :approve do |counselor, transition|
      RegistrationMailer.approval_notification(counselor).deliver
    end
  end

  def alert_admins_of_submission
    RegistrationMailer.counselor_submission(self).deliver
  end

  def day_info=(hash)
    transaction do
      hash.each do |k,v|
        days.find_or_create_by_date(k.to_date).update_attributes(v)
      end
    end
  end

  def self.search_result(params_q)
    params_q["specialities_issue_name_eq"] = params_q["specialities_issue_name_eq"].underscore if params_q["specialities_issue_name_eq"]
    search(params_q).result(distinct: true)
  end

  def set_all_availability!
    Availability::DAYS.each do |d|
      days.find_or_create_by_day(d).update_attribute(:available_hours, (0..23).to_a)
    end
  end

  def unset_all_availability!
    days.destroy_all
  end

  def session_slots(date)
    hours_list(date).size
  end

  def available_on?(date)
    session_slots(date) > 0
  end

  def available_at?(date, hour)
    hours_list(date).include?(hour)
  end

  # value for checkboxes
  def appointment_value_for(date, hour)
    available_at?(date, hour) ? 1 : 0
  end

  def hours_list(date)
    days.find_by_date(date).try(:available_hours).try(:sort) || []
  end

  def us?
    country == 'US'
  end

  def location
    if us?
      "#{city}, #{state_or_province}"
    else
      "#{city}, #{country}"
    end
  end

  def session_booked_on?(start_time)
    counseling_sessions.where("start_datetime = ?", start_time).present?
  end

end
