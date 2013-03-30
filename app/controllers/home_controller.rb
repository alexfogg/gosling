class HomeController < ApplicationController
  def index
  end


  def call
    session[:name] = params[:name]
    client= Twilio::REST::Client.new(ENV['TW_SID'], ENV['TW_TOK'])
    @call = client.account.calls.create(
      :from => '+17329630742',
      :to => '+16095589593',
      :url => "http://4gc6.localtunnel.com/voice"
    )

    redirect_to root_path
  end


  def voice
    response = Twilio::TwiML::Response.new do |r|
      r.Say session[:name]
      r.Play 'http://demo.twilio.com/hellomonkey/monkey.mp3'
    end
    render :xml => response.text
  end

end
