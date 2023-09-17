class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index creste]
  before_action :find_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found
#все вопросы конкретного теста
  def index
    render json: find_test.questions
  end
#просмотр конкретного вопроса теста
  def show
    render json: find_question
  end

  def destroy
    find_question.destroy
  end

  def new
  end

  def create
    @question = find_test.questions.new(body: params.permit(:body))
    if @question.save
      render inline: '<p>Question: <%= @question.body %>! was save </p>'
    else
      render html: '<h1> Question was not save </h1>'.html_safe
    end
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found'
  end

end
