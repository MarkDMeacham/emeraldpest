class DashboardController < ApplicationController
  layout 'dashboard'
  before_filter :authenticate
end
