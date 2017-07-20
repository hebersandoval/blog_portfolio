class Post < ApplicationRecord
  before_create :set_slug
  validates :slug, presence: true

  has_many :post_categories
  has_many :categories, through: :post_categories

  def slug
    title.downcase.gsub(' ', '-')
  end

  def to_param
    slug
  end

  # Search for posts based on its content
  def self.search(search)
    where("title || content LIKE ?", "%" + search + "%")
  end

  private

  def set_slug
    self.slug = title.parameterize
  end
end
