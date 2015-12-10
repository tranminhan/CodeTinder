OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1522577408067356', '80b9528c7f49139284e79791b750b606'
end 