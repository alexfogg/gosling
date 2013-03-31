# == Schema Information
#
# Table name: messages
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  category   :string(255)
#  message    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Message < ActiveRecord::Base
  attr_accessible :name, :category, :message
  belongs_to :ryan


  def self.text(number, name, type)
    a = Message.where("category" => type).sample.message
    client= Twilio::REST::Client.new(ENV['TW_SID'], ENV['TW_TOK'])
    client.account.sms.messages.create(:from => '+17329630742', :to => number, :body => a )
      a
  end


end
