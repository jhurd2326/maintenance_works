# frozen_string_literal: true

class Role < ApplicationRecord
  LEVELS = %w(
    admin
    maintenance_worker
    hospital_employee
    outside_user
  )
end
