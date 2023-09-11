class QuestionsController < ApplicationController
  before_action :find_test, only: %i[show]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

 #все вопросы
  def index
    render json: {questions: Question.all}
  end

#все вопросы конкретного теста
  def show
    render json: {questions: Question.where(test_id: params[:id] )}
  end

#просмотр конкретного вопроса теста
  def show_question
    #render json: {questions: Question.find(id: params[:id])} - почему-то так не работает
    render json: {questions: Question.where(id: params[:id])}
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
  end
  
  def new

  end

  def create
    @question = Question.create(question_params)
    render plain: @question.inspect
  end

  private
  def question_params
    params.require(:question).permit(:test_id, :body)
  end

  def find_test
    @test = Test.find(params[:id])
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found'
  end

end
