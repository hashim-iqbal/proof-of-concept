# frozen_string_literal: true

class User < ApplicationRecord
  has_many :events

  validates :name, :avatar, :occupation, presence: true
end
