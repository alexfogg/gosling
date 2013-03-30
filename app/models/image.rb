# == Schema Information
#
# Table name: images
#
#  id   :integer          not null, primary key
#  name :string(255)
#  url  :text
#

class Image < ActiveRecord::Base
attr_accessible :name, :url
belongs_to :ryan
end
