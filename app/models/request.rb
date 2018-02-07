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

class Request < ApplicationRecord
  include Searchable

  has_many :notes, dependent: :destroy

  belongs_to :hospital
  belongs_to :device
  belongs_to :user

  attr_accessor :manufacturer, :model, :serial_number, :equipment_type, :note_content

  searchable_fields :id, :problem_type, device: %i(serial_number model manufacturer equipment_type)

  ProblemType::TYPES.each do |type|
    define_method("#{type}_problem?") { problem_type == type }
  end
end
