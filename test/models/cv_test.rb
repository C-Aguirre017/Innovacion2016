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

require 'test_helper'

class CvTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
