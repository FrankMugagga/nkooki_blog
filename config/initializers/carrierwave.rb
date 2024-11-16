# config/initializers/carrierwave.rb

if Rails.application.credentials.dig(:cloudinary, :'dbcjfpezb').present? || ENV['CLOUDINARY_URL'].present?
    CarrierWave.configure do |config|
      # Set up CarrierWave to use Cloudinary
      config.storage = :cloudinary
  
      # If using Rails credentials (recommended), set up Cloudinary credentials from there
      if Rails.application.credentials.dig(:cloudinary, :'dbcjfpezb')
        config.cloudinary_credentials = {
          cloud_name: Rails.application.credentials.dig(:cloudinary, :'dbcjfpezb'),
          api_key: Rails.application.credentials.dig(:cloudinary, :'786283298793769'),
          api_secret: Rails.application.credentials.dig(:cloudinary, :'Sx9DIH2_TUBKnFJQnI0nfSrjP3Y')
        }
      end
    end
  end
  