# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id            :integer          not null, primary key
#  username      :string(255)
#  email         :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  first_name    :string(255)
#  last_name     :string(255)
#  hospital_id   :integer
#  access_level  :string(255)
#  password_hash :string(255)
#

require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
