class Project < ApplicationRecord
  before_create :set_slug

  has_many :project_categories
  has_many :categories, through: :project_categories

  def to_param
    "#{id}-#{slug}"
  end

  private

  def set_slug
    self.slug = title.parameterize
  end
end
