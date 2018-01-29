# frozen_string_literal: true

# == Schema Information
#
# Table name: roles
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  level      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Role < ApplicationRecord
  belongs_to :user

  LEVELS = %w(
    admin
    maintenance_worker
    hospital_employee
    outside_user
  )
end
