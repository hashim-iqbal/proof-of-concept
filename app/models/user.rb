# frozen_string_literal: true

class User < ApplicationRecord
  has_many :events
  has_many :impressions
  has_many :conversions

  validates :name, :avatar, :occupation, presence: true
end
