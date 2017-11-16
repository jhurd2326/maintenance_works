# frozen_string_literal: true

class CreateDevices < ActiveRecord::Migration[5.1]
  def change
    create_table :devices do |t|
      t.integer :quantity
      t.string :cost
      t.text :description
      t.string :name
      t.integer :hospital_id

      t.timestamps
    end
  end
end
