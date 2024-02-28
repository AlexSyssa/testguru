class TestPassagesController < ApplicationController

  before_action :authenticate_user!
  before_action :find_test_passage, only: %i[show update result gist]
  before_action :check_box, only: %i[update]

  def show
  end

  def result
  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      BadgeService.new(@test_passage).call if @test_passage.successful? 

      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  private

  def find_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def check_box
    if params[:answer_ids].nil?
      flash.now.alert = "Вам необходимо выбрать ответ"
      render :show
    end
  end
end
