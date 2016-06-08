# == Schema Information
#
# Table name: retires
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  telephone  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Retire < ActiveRecord::Base
  belongs_to :user

  has_many :cv, class_name: "Cv", foreign_key: "retire_id"
  has_many :abilities, through: :cv,  source: :ability

  has_many :applications, class_name: "Application", foreign_key: "retire_id"
  has_many :followers, through: :applications, source: :user


  def has_abilities?
    !abilities.nil?
  end

  def has_ability?(ability_id)
    abilities.where(id: ability_id).count > 0
  end

  def has_notifications?
    applications.where(is_valid: false).count > 0
  end

end
