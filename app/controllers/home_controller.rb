class HomeController < ApplicationController
  def index
    @video = Video.all.sample
    @texts = Message.all.map(&:category).uniq.sort
  end

  def refresh
    @video = Video.all.sample
  end

  def news
  end

  def call
    session[:name] = params[:name]
    number = params[:number]
    number = "+1#{number}"
    client= Twilio::REST::Client.new(ENV['TW_SID'], ENV['TW_TOK'])
    @call = client.account.calls.create(
      :from => '+17329630742',
      :to => number,
      :url => "http://3kaf.localtunnel.com/voice",
    )
    redirect_to root_path
  end


  def voice
    response = Twilio::TwiML::Response.new do |r|
      # r.Say "Hey #{name}"
      r.Play 'http://memberfiles.freewebs.com/91/14/65951491/podcast/Barney_ending.mp3'
    end
    render :xml => response.text
  end

  def message
    number = "+1#{params[:number]}"
    name = params[:name]
    type = params[:texts]

    @a =Message.text(number, name, type)
  end

end
