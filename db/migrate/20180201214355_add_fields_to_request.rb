# frozen_string_literal: true

class AddFieldsToRequest < ActiveRecord::Migration[5.1]
  def change
    remove_column :requests, :repairable, :boolean

    add_column :requests, :repaired, :boolean
    add_column :requests, :abandoned, :boolean
    add_column :requests, :plumbing_problem, :boolean
    add_column :requests, :motor_problem, :boolean
    add_column :requests, :electric_problem, :boolean
    add_column :requests, :mechanical_problem, :boolean
    add_column :requests, :power_problem, :boolean
    add_column :requests, :training_problem, :boolean
    add_column :requests, :other_problem, :boolean
  end
end
