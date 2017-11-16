# frozen_string_literal: true

# == Schema Information
#
# Table name: verified_phone_numbers
#
#  id           :integer          not null, primary key
#  hospital_id  :integer
#  user_id      :integer
#  phone_number :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class VerifiedPhoneNumber < ApplicationRecord
  belongs_to :hospital
  belongs_to :user
end
