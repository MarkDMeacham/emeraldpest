class Blog < ActiveRecord::Base
  belongs_to :creator, class_name: :User
  belongs_to :updator, class_name: :User

  validates :title, :text, :creator, :updator, :slug, presence: true
  validates :slug, uniqueness: true
  before_validation -> {self.slug = self.title&.downcase.gsub(' ', '-').gsub(/[^\w\-]/, '')}

  def self.find_by_slug(slug)
    find_by(slug: slug)
  end

  def self.search(params)
    term = "%#{params[:term].to_s.as_search_param}"
    query = Blog.reorder(id: :desc)

    if params[:term].present?
      query = query.where("title LIKE :term OR text LIKE :term OR tags LIKE :term", term: term)
    end

    return query
  end

  def split_tags
    tags.split(",").reject{|tag| tag.blank?}.map{|tag| tag.strip}
  end
end
