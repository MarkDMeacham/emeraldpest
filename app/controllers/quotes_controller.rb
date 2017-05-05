class QuotesController < ApplicationController
  def new
  end

  def create
    RequestMailer.quote(params).delivery_now
  end
end