class Review < ActiveRecord::Base
  validates :name, :text, presence: true
end
