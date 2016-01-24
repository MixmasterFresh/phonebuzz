class DialController < ApplicationController
  require 'twilio-ruby'
  def index
  end
  
  def call
    Twilio.configure do |config|
      config.account_sid = ENV(ACCOUNT_SID)
      config.auth_token = ENV(AUTH_TOKEN)
    end
    @client = Twilio::REST::Client.new
    
    @call = @client.calls.create(
      from: "+#{ENV(FROM_NUMBER)}",
      to: "+#{params[:number]}",
      url: 'http://#{request.base_url}/twiml/start'
    )
    
    redirect_to :root
  end
end