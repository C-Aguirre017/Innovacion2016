# == Schema Information
#
# Table name: retires
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  telephone  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  resume     :text
#

require 'test_helper'

class RetireTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
