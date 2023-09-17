class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index create]
  before_action :find_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render json: @test.questions
  end

  def show
    render json: @question
  end

  def destroy
    @question.destroy
  end

  def new
  end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      render inline: '<p>Question: <%= @question.body %>! was save </p>'
    else
      render html: '<h1> Question was not save </h1>'.html_safe
    end
  end

  private

  def question_params
    params.permit(:body)
  end

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
