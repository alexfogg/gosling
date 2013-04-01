class HomeController < ApplicationController
  def index
    @video = Video.all.sample
    @texts = Message.all.map(&:category).uniq.sort
    @articles = Article.all()
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
      :url => "http://4627.localtunnel.com/voice",
    )
  end


  def voice
    response = Twilio::TwiML::Response.new do |r|
       r.Say "Get ready for your daily dose of Mr. Ryan Gosling."
      # r.Play Audio.all.sample.url
      r.Play "https://s3.amazonaws.com/gosling/RyanIntrospective.mp3"
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
