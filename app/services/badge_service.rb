class BadgeService
  def initialize(test_passage)
    @test_passage = test_passage
    @badges = []
  end

  def call
    check!
    @test_passage.user.badges.push(@badges)
  end

  def check!
    @badges = Badge.all.select do |badge|
      send(badge.method, badge.option)
    end
  end

  private

  def rule_first_try?(_option)
    test_passages = TestPassage.where(test: @test_passage.test, user: @test_passage.user)
    test_passages.count == 1 && @test_passage.successful?
  end

  def rule_all_level?(option_level)
    return false if option_level.to_i != @test_passage.test.level

    tests = Test.where(level: option_level.to_i).pluck(:id)
    completed = @test_passage.user.test_passages.success.where(test: tests).pluck(:test_id).uniq

    tests.count == completed.count
  end

  def rule_all_category?(rule_category)
    return false if rule_category != @test_passage.test.category.title

    tests =  Test.by_category(rule_category).pluck(:id)
    completed = @test_passage.user.test_passages.success.where(test: tests).pluck(:test_id).uniq
    tests.count == completed.count
  end
end
