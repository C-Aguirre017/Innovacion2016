# == Schema Information
#
# Table name: applications
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  retire_id  :integer
#  is_valid   :boolean
#  read       :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Application < ActiveRecord::Base
  belongs_to :user
  belongs_to :retire

  has_one :evaluation, class_name:"Evaluation", foreign_key: "application_id"
end
