class Project < ApplicationRecord
  before_create :set_slug

  def to_param
    "#{id}-#{slug}"
  end

  private

  def set_slug
    self.slug = title.parameterize
  end
end
