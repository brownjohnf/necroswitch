module NecroTwilio
  class << self
    attr_accessor :client
  end

  # alternatively, you can preconfigure the client like so
  ::Twilio.configure do |config|
    config.account_sid = ENV["TWILIO_ACCOUNT_SID"]
    config.auth_token = ENV["TWILIO_AUTH_TOKEN"]
  end

  # and then you can create a new client without parameters
  self.client = ::Twilio::REST::Client.new
end

