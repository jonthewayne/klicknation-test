# If an s3.yml file exists, you're in development or test enviro so use the key, secret key, and bucket values from there.
# Otherwise you're in production enviro on heroku, so pull them from the environment.
if File.exists?("#{Rails.root}/config/s3.yml")
  s3_config = YAML.load_file("#{Rails.root}/config/s3.yml")
  S3 = Hash.new
  S3[:key] = s3_config[Rails.env]['key']
  S3[:secret] = s3_config[Rails.env]['secret']
  S3[:bucket] = s3_config[Rails.env]['bucket']
else
  S3 = Hash.new
  S3[:key] = ENV['S3_KEY']
  S3[:secret] = ENV['S3_SECRET']
  S3[:bucket] = ENV['S3_BUCKET']
end
