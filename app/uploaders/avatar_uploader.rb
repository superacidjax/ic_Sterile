class AvatarUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url
    ["/images/img_counselor", version_name].compact.join('_') + ".jpg"
  end

  version :small do
    process :resize_to_fill => [33, 33]
  end

  version :medium do
    process :resize_to_fill => [65, 65]
  end

  version :profile do
    process :resize_to_fill => [90, 90]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

end
