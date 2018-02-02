# frozen_string_literal: true

class AddFieldsToDevice < ActiveRecord::Migration[5.1]
  def change
    remove_column :devices, :quantity, :integer
    remove_column :devices, :description, :text
    remove_column :devices, :name, :string

    add_column :devices, :serial_number, :string
    add_column :devices, :model, :string
    add_column :devices, :equipment_type, :string
    add_column :devices, :manufacturer, :string
  end
end
