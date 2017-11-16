# == Schema Information
#
# Table name: devices
#
#  id          :integer          not null, primary key
#  quantity    :integer
#  cost        :string(255)
#  description :text(65535)
#  name        :string(255)
#  hospital_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class DeviceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
