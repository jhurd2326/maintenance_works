# frozen_string_literal: true

class ProblemType < ApplicationRecord
  TYPES = %w(
    plumbing
    motor
    electrical
    mechanical
    power
    training_installation
    other
  )
end
