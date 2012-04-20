class Account < ActiveRecord::Base
  attr_accessor :force_password_required

  devise :database_authenticatable, :recoverable, :registerable, :rememberable,
    :timeoutable, :validatable
  belongs_to :role, :polymorphic => true, :inverse_of => :account
  validates_acceptance_of :terms_of_service
  validates_presence_of :role

  scope :admin, where(role_type: 'Admin')

  def self.admin_emails
    admin.map(&:email)
  end

   protected

   def password_required?
     @force_password_required || !persisted? || password.present? || password_confirmation.present?
   end

end
