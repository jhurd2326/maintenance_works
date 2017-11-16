# frozen_string_literal: true

class CreateVerifiedPhoneNumbers < ActiveRecord::Migration[5.1]
  def change
    create_table :verified_phone_numbers do |t|
      t.integer :hospital_id
      t.integer :user_id
      t.string :phone_number

      t.timestamps
    end
  end
end
