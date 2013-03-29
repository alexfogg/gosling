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





end
