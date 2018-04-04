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

class Hospital < ApplicationRecord
  validates :name, presence: true
  
  has_many :devices, dependent: :destroy
  has_many :requests, dependent: :destroy
  has_many :users
end
