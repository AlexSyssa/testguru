class TestsController < ApplicationController

  before_action :authenticate_user!
  before_action :find_test, only: %i[start]

  def index
    @tests = Test.where(public: 'true')
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
    # timer_test
  end

#Хотела чрез gem timers или countdown - не получилось, почему не смогла понять
  # def timer_test
  #   time_test = @test.timer
  #   timers = Timers::Group.new
  #   t = timers.after(time_test) {
  #     redirect_to tests_path, notice: 'Ваше время вышло'
  #   }
  # end

  private

  def find_test
    @test = Test.find(params[:id])
  end

end
