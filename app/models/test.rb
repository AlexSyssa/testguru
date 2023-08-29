class Test < ApplicationRecord
  has_many :questions
  has_many :tests_users
  has_many :users, through: :tests_users

  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  validates :title, presence: true, uniqueness: { scope: :level}
  validates :level, numericality: { only_integer: true, greater_then_or_equal_to: 1 }

  scope :easy_level, -> { where(level: 0..1) }
  scope :medium_level, -> { where(level: 2..4) }
  scope :hard_level, -> { where(level: 5..Float::INFINITY) }
  scope :by_category, ->(category) {joins(:category).where(categories: { title: category }) }

end
