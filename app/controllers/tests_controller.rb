class TestsController < ApplicationController

  before_action :authenticate_user!
  before_action :find_test, only: %i[start]

  def index
    @tests = Test.all
  end

  def start
    if @test.questions.empty?
      redirect_to root_path, alert: "Test hasn't questions"
    else
      current_user.tests.push(@test)
      redirect_to current_user.test_passage(@test)
    end
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

end
