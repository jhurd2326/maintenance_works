# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  username   :string(255)
#  email      :string(255)
#  password   :string(255)
#  salt       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require "bcrypt"

class User < ApplicationRecord
  include BCrypt

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :username, presence: true, uniqueness: true, length: { in: 3..20 }
  validates :email, presence: true, uniqueness: true, format: EMAIL_REGEX
  validates :password, presence: true, length: { minimum: 6 }, confirmation: true
  validates_length_of :password, in: 6..20, on: :create

  before_save :encrypt_password

  def self.authenticate(username = "", pass = "")
    user = User.find_by(username: username)
    return user if user && user.match_password(pass)
    false
  end

  def encrypt_password
    return unless password.present?
    self.salt = BCrypt::Engine.generate_salt
    self.password = BCrypt::Engine.hash_secret(password, salt)
  end

  def match_password(pass = "")
    password == BCrypt::Engine.hash_secret(pass, salt)
  end
end
