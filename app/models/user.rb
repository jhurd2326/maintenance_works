# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id           :integer          not null, primary key
#  username     :string(255)
#  email        :string(255)
#  password     :string(255)
#  salt         :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  first_name   :string(255)
#  last_name    :string(255)
#  hospital_id  :integer
#  access_level :string(255)
#

require "bcrypt"

class User < ApplicationRecord
  include BCrypt

  has_many :requests
  has_many :notes
  has_one :verified_phone_number, dependent: :destroy

  belongs_to :hospital, optional: true

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :username, presence: true, uniqueness: true, length: { in: 3..20 }
  validates :email, presence: true, uniqueness: true, format: EMAIL_REGEX

  def self.authenticate(username = "", pass = "")
    user = User.find_by(username: username)
    return user if user&.match_password(pass)
    false
  end

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

  def match_password(pass = "")
    password == pass
  end

  Role::LEVELS.each do |level|
    define_method("#{level}?") { access_level == level }
  end
end
