class ProfilePictureUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  storage :file
  def extension_whitelist
    %w[jpg jpeg gif png webp]
  end
  version :thumb do
    process resize_to_fill: [100, 100]
  end
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
end
