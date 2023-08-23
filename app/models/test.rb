class Test < ApplicationRecord
  has_many :questions
  has_many :tests_users
  has_many :users, through: :tests_users

  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  validates :title, presence: true, uniqueness: { scope: :level}
  validates :level, numericality: { only_integer: true, greater_then_or_equal_to: 1 }

  scope :easy_level, -> { where(level: 0..1).order(created_at: :desc) }
  scope :medium_level, -> { where(level: 2..4).order(created_at: :desc) }
  scope :hard_level, -> { where(level: 5..Float::INFINITY).order(created_at: :desc) }
  scope :by_category, ->(category) {joins(:category).where(categories: { title: category }) }

  def self.sort_by_category(category)
    by_category.pluck(:title).order(title: :desc)
  end


end
