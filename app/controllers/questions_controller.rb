class QuestionsController < ApplicationController
  before_action :find_test, only: %i[show]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found
#все вопросы конкретного теста
  def index
    render json: {questions: Question.where(test_id: params[:test_id])}
  end
#просмотр конкретного вопроса теста
  def show
    render json: {questions: Question.find(params[:id])}
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
  end

  def new
  end

  def create
    @question = Question.new(test_id: params[:test_id], body: params.permit(:body))
    if @question.save
      render inline: '<p>Question: <%= @question.body %>! was save </p>'
    else
      render html: '<h1> Question was not save </h1>'.html_safe
    end
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found'
  end

end
