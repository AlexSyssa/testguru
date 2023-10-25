class Admin::QuestionsController < Admin::BaseController

  before_action :find_test, only: %i[new index create]
  before_action :find_question, only: %i[edit update show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = @test.questions
  end

  def show
  end

  def destroy
    @question.destroy

    redirect_to [:admin, @question.test], notice: 'Question was deleted'
  end

  def new
    @question = @test.questions.new
  end

  def edit
  end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      redirect_to [:admin, @question], notice: 'Question was saved'
    else
      render :new, notice: 'Question was not saved'
    end
  end

  def update
    if @question.update(question_params)
      redirect_to admin_question_path(@question), notice: 'Question was successfully updated'
    else
      render :edit
    end
  end

  private

  def question_params
    params.require(:question).permit(:body)
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
