# frozen_string_literal: true

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

class Request < ApplicationRecord
  has_many :notes, dependent: :destroy
  accepts_nested_attributes_for :notes

  belongs_to :hospital
  belongs_to :device
  belongs_to :user
end
