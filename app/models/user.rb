class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: 'Test', foreign_key: :author_id

  EMAIL_PATTERN = /\A\w+@\w+\.\w+\z/

  validates :email, presence: true, uniqueness: true,
            format: EMAIL_PATTERN

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

end
