# == Schema Information
#
# Table name: audios
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  url        :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Audio < ActiveRecord::Base
  attr_accessible :name, :url
  belongs_to :ryan


  def voice
    client= Twilio::REST::Client.new(ENV['TW_SID'], ENV['TW_TOK'])


  end


end

#someone calls twilio #s -> # pints to url
#from URL -> points to controler + route
