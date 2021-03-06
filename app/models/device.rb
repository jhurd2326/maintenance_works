# frozen_string_literal: true

# == Schema Information
#
# Table name: devices
#
#  id             :integer          not null, primary key
#  cost           :string(255)
#  hospital_id    :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  serial_number  :string(255)
#  model          :string(255)
#  equipment_type :string(255)
#  manufacturer   :string(255)
#

class Device < ApplicationRecord
  validates :manufacturer, presence: true
  validates :model, presence: true
  validates :serial_number, presence: true

  has_many :requests, dependent: :destroy

  belongs_to :hospital
end
