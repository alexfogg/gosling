# == Schema Information
#
# Table name: ryans
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  img        :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Ryan < ActiveRecord::Base
attr_accessible :name, :img
has_many :audios
has_many :videos
has_many :messages





end

