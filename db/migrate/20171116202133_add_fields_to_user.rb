# frozen_string_literal: true

class AddFieldsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :hospital_id, :integer
    add_column :users, :access_level, :string
  end
end
