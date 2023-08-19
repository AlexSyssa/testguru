class User < ApplicationRecord

  def by_level(level)
    Test.joins("LEFT JOIN user_tests ON user_tests.test_id = tests.id")
    .where("tests.level = #{level}")
    .where("user_tests.user_id = #{self.id}")
    .order(created_at: :asc)
  end
end
