# frozen_string_literal: true

class User < ApplicationRecord
  validates :name, :avatar, :occupation, presence: true
end
