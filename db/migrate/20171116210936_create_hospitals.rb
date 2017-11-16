# frozen_string_literal: true

class CreateHospitals < ActiveRecord::Migration[5.1]
  def change
    create_table :hospitals do |t|
      t.string :name
      t.string :country
      t.string :address
      t.string :city
      t.string :phone_number

      t.timestamps
    end
  end
end
