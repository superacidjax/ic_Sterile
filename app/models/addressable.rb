module Addressable
  extend ActiveSupport::Concern

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
end
