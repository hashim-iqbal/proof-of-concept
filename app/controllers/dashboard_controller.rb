# frozen_string_literal: true

class DashboardController < ApplicationController
  def index
    @users = User.includes(:events)
  end
end
