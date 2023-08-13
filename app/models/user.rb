class User < ApplicationRecord

  def by_level(level)
    tests.where(level: level)
  end
end
