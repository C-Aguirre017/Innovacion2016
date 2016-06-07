# == Schema Information
#
# Table name: cvs
#
#  id         :integer          not null, primary key
#  ability_id :integer
#  retire_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Cv < ActiveRecord::Base
  belongs_to :ability
  belongs_to :retire
end
