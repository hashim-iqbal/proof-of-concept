# frozen_string_literal: true

class Event < ApplicationRecord
  self.inheritance_column = false
  belongs_to :user

  enum type: %i[conversion impression]

  validates :time, :type, :revenue, presence: true
  validates :user_id, uniqueness: { scope: %i[type time] }

  default_scope { order(:time) }
end
