class Post < ApplicationRecord
  before_create :set_slug

  has_many :post_categories
  has_many :categories, through: :post_categories

  def to_param
    "#{id}-#{slug}"
  end

  private

  def set_slug
    self.slug = title.parameterize
  end
end
