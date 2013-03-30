class HomeController < ApplicationController
  def index
  end


  def voice
    client= Twilio::REST::Client.new(ENV['TW_SID'], ENV['TW_TOK'])
    @call = client.account.calls.create(
      :from => '+17329630742',
      :to => '+17324039102',
      :url => 'http://salty-plateau-3968.herokuapp.com/voice'
    )
    response = Twilio::TwiML::Response.new do |r|
      r.Play 'http://www.1songday.com/wp-content/uploads/2012/10/Latch.mp3'
    end
    render :xml => response
  end






end
