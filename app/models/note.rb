# frozen_string_literal: true

# == Schema Information
#
# Table name: notes
#
#  id         :integer          not null, primary key
#  request_id :integer
#  content    :text(65535)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Note < ApplicationRecord
  belongs_to :request
  belongs_to :user
end
