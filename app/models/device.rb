# frozen_string_literal: true

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

class Device < ApplicationRecord
  has_many :requests, dependent: :destroy

  belongs_to :hospital
end
