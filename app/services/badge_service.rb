class BadgeService
  def initialize(test_passage)
    @user = test_passage.user
    @test_passage = test_passage
  end

  def call
    Badge.all.each do |badge|
      add_badge!(badge) if rule_first_try?

    end
  end

  private

  def add_badge!(badge)
    @user.badges.push(badge)
  end

  def rule_first_try?
    test_passages = TestPassage.where(test: @test_passage.test, user: @test_passage.user)
    test_passages.count == 1
  end

  # def rule_category(category)
  #   if @test_passage.test.category.title == category
  # end

  # def badge_issued?(badge)
  #   @user.badges.find_by(id: badge.id)
  # end
end
