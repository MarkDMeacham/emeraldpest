class Quote < ActiveRecord::Base
  validates :name, :phone, :email, presence: true
  attr_accessor :verification
end