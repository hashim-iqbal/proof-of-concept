# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :user

  TYPE_MAP = {
    conversion: 'Conversion',
    impression: 'Impression'
  }
  TYPES = TYPE_MAP.values

  validates :type, inclusion: { in: TYPES }
  validates :time, :type, :revenue, presence: true
  validates_uniqueness_of :user_id, scope: %i[type time]
end
