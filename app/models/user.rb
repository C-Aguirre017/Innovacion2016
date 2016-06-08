# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  name                   :string
#  last_name              :string
#  sex                    :string
#  birthday               :datetime
#  city                   :string
#  commune                :string
#  state                  :string
#  linkedin               :text
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :retire
  has_many :applications, class_name: "Application", foreign_key: "user_id"
  has_many :following, through: :applications, source: :retire

  has_many :evaluations, class_name: "Evaluation", foreign_key: "user_id"
  has_many :evaluations_with_applications, through: :evaluations, source: :application

  def retire?
    !retire.nil?
  end

  def is_accepted?(user_id)
    user = User.find_by(id: user_id)
    if user
      if user.retire?
        aux = applications.where(retire_id: user.retire.id)
        if aux.count > 0
          return aux.first.is_valid
        end
      end
    end
    false
  end

  def full_name
    "#{name.to_s} #{last_name.to_s}"
  end

  def following?(id)
    following.where(id: id).count > 0
  end

  def get_score
    sum = 0
    total = 0
    aux = false
    evaluations.each do |evaluation|
      if evaluation.value != 0
        aux = true
        sum += evaluation.value
        total += 1
      end
    end

    aux ? sum/total : 0
  end

  def get_followers
    applications.where(is_valid: true).joins(:retire)
  end

end
