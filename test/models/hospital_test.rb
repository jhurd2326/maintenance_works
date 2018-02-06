# frozen_string_literal: true

# == Schema Information
#
# Table name: hospitals
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  country      :string(255)
#  address      :string(255)
#  city         :string(255)
#  phone_number :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require "test_helper"

class HospitalTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
