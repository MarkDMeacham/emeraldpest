class QuotesController < ApplicationController
  def new
  end

  def create
    RequestMailer.quote(params).deliver_now
  end
end