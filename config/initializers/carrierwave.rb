CarrierWave.configure do |config|
  if Rails.env.staging? || Rails.env.production?
    config.storage = :fog
    config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     ENV['S3_ACCESS_KEY_ID'],
      aws_secret_access_key: ENV['S3_SECRET_ACCESS_KEY']
    }

    config.fog_directory = "icouch#{Rails.env}"
    config.fog_host = %Q{#{ENV['ICOUCH_SSL'].present? ? ENV['ICOUCH_SSL'] : "https"}://#{Rails.env.production? || Rails.env.staging? ? "dona0ooh6fh8e" : "d25kgg0l352qbz"}.cloudfront.net}

    config.cache_dir = "#{Rails.root}/tmp/uploads"
  else
    config.storage = :file
    config.store_dir = "uploads/#{Rails.env}"
    config.enable_processing = Rails.env.development?
  end
end
