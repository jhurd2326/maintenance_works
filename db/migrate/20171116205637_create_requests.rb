# frozen_string_literal: true

class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.boolean :repairable
      t.integer :hospital_id
      t.integer :device_id
      t.integer :user_id

      t.timestamps
    end
  end
end
