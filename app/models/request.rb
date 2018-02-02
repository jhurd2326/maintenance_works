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

  belongs_to :hospital
  belongs_to :device
  belongs_to :user

  attr_accessor :manufacturer, :model, :serial_number, :equipment_type, :note_content
end
