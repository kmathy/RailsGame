Geocoder.configure do |config|
  config.lookup = :google
  config.use_https = true
  config.api_key = ENV["GOOGLE_API"]
  config.timeout = 10
  config.units = :km
end