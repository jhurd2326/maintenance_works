# frozen_string_literal: true

class RemoveSaltFromUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :salt, :string
    remove_column :users, :password, :string

    add_column :users, :password_hash, :string
  end
end
