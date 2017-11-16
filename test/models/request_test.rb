# == Schema Information
#
# Table name: requests
#
#  id          :integer          not null, primary key
#  repairable  :boolean
#  hospital_id :integer
#  device_id   :integer
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class RequestTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
