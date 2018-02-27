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
  TYPES.each do |prob_type|
    define_method("self.#{prob_type.to_s.downcase}") { prob_type }
  end
end
