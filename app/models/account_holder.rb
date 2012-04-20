module AccountHolder
  extend ActiveSupport::Concern
  included do
    has_one :account, :as => :role, :inverse_of => :role
    accepts_nested_attributes_for :account
    delegate(
      :terms_of_service, :terms_of_service=,
      :email, :email=,
      :password, :password=,
      :password_confirmation, :password_confirmation=,
      :to => :find_or_initialize_account
    )
    validate :expose_account_errors
    after_initialize :find_or_initialize_account
  end

  protected

  def find_or_initialize_account
    account || build_account
  end

  def expose_account_errors
    if account.try(:invalid?)
      account.errors.each do |key, value|
        errors.add(key, value)
        errors.delete(:"account.#{key}")
      end
    end
  end
end
