class Blog < ActiveRecord::Base
  belongs_to :creator, class_name: :User
  belongs_to :updator, class_name: :User

  validates :title, :text, :creator, :updator, :slug, presence: true
  validates :slug, uniqueness: true
  before_validation -> {self.slug ||= self.title&.downcase.gsub(' ', '-').gsub(/[^\w\-]/, '')}

  def self.find_by_slug(slug)
    find_by(slug: slug)
  end
end
