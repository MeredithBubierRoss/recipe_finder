Yummly.configure do |config|
  config.app_id = ENV["YUMMLY_APP_ID"]
  config.app_key = ENV["YUMMLY_APP_KEY"]
  config.use_ssl = true # Default is false
end
