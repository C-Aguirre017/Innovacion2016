# == Schema Information
#
# Table name: abilities
#
#  id         :integer          not null, primary key
#  category   :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Ability < ActiveRecord::Base

  has_many :cv, class_name: "Cv", foreign_key: "ability_id"
  has_many :retires, through: :cv, source: "retire_id"

end
