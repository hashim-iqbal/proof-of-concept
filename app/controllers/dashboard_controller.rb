# frozen_string_literal: true

class DashboardController < ApplicationController
  def index
    @users = User.includes(:conversions, :impressions, :events)
  end
end
