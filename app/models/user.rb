class User < ApplicationRecord

#  has_and_belongs_to_many :tests
has_many :tests_users
has_many :tests, through: :tests_users
has_many :created_tests, class_name: 'Test', foreign_key: :author_id

validates :email, presence: true

def by_level(level)
    tests.where(level: level)
   .order(created_at: :asc)
  end
end
