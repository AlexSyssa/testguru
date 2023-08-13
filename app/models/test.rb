class Test < ApplicationRecord
  belongs_to :category

  def self.sort_by_category(category_title)
    joins(:category)
    .where(categories: { title: category_title })
    .order(title: :desc).pluck(:title)
  end
end
