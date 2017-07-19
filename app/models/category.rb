class Category < ApplicationRecord
  validates :name, presence: true
  validates :slug, presence: true

  has_many :post_categories
  has_many :posts, through: :post_categories

  def to_param
    slug
  end
end
