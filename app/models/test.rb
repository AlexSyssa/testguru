class Test < ApplicationRecord
  has_many :questions
  has_many :tests_users
  has_many :users, through: :tests_users

  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  def self.sort_by_category(category_title)
    joins(:category)
    .where(categories: { title: category_title })
    .order(title: :desc).pluck(:title)
  end
end
