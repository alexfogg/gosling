class HomeController < ApplicationController
  def index
  end


  def voice
    client= Twilio::REST::Client.new(ENV['TW_SID'], ENV['TW_TOK'])
    @call = client.account.calls.create(
      :from => '+17329630742',
      :to => '+17324039102',
      :url => 'http://56ss.localtunnel.com/voice'
    )
    response = Twilio::TwiML::Response.new do |r|
      r.Play 'http://demo.twilio.com/hellomonkey/monkey.mp3'
    end
    render :xml => response
  end






end
