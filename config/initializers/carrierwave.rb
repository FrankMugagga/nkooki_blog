# config/initializers/carrierwave.rb

if Rails.application.credentials.dig(:cloudinary, :cloud_name).present? || ENV['CLOUDINARY_URL'].present?
    CarrierWave.configure do |config|
      # Set up CarrierWave to use Cloudinary
      config.storage = :cloudinary
  
      # If using Rails credentials (recommended), set up Cloudinary credentials from there
      if Rails.application.credentials.dig(:cloudinary, :cloud_name).present?
        config.cloudinary_credentials = {
          cloud_name: Rails.application.credentials.dig(:cloudinary, :cloud_name),
          api_key: Rails.application.credentials.dig(:cloudinary, :api_key),
          api_secret: Rails.application.credentials.dig(:cloudinary, :api_secret)
        }
      elsif ENV['CLOUDINARY_URL'].present?
        config.cloudinary_credentials = Cloudinary::Url.new(ENV['CLOUDINARY_URL'])
      end
    end
  end
  