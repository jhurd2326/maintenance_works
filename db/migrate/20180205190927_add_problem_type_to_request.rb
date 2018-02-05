# frozen_string_literal: true

class AddProblemTypeToRequest < ActiveRecord::Migration[5.1]
  def change
    add_column :requests, :problem_type, :string
  end
end
