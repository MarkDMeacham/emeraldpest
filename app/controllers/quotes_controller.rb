require 'net/http'
class QuotesController < ApplicationController
  def index
    @quote = Quote.new
    render 'new'
  end

  def new
    @quote = Quote.new
  end

  def create
    @quote = Quote.new(quote_params)
    @quote.errors.add(:verification, " response is incorrect.") if params[:verification].to_s.downcase.strip != "emerald"
    render 'new' and return if @quote.errors.any? || !@quote.save

    RequestMailer.quote(@quote).deliver_now unless Rails.env.development?
    render 'thank_you'
  end

  private
  def quote_params
    return params.require(:quote).permit(:name, :email, :phone, :address, :notes)
  end
end