# == Schema Information
#
# Table name: videos
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  url        :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Video < ActiveRecord::Base
attr_accessible :name, :url
belongs_to :ryan

end
