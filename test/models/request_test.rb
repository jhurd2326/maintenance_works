# frozen_string_literal: true

# == Schema Information
#
# Table name: requests
#
#  id           :integer          not null, primary key
#  hospital_id  :integer
#  device_id    :integer
#  user_id      :integer
#  repaired     :boolean
#  abandoned    :boolean
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  problem_type :string(255)
#

require "test_helper"

class RequestTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
