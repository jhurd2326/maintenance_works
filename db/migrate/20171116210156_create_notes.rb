# frozen_string_literal: true

class CreateNotes < ActiveRecord::Migration[5.1]
  def change
    create_table :notes do |t|
      t.integer :request_id
      t.text :content
      t.integer :user_id

      t.timestamps
    end
  end
end
