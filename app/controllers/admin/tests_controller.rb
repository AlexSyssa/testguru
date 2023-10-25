class Admin::TestsController < Admin::BaseController

  before_action :find_test, only: %i[show edit update destroy start]

  def index
    @tests = Test.all
  end

  def show
  end

  def edit
  end

  def update
    if @test.update(test_params)
      redirect_to admin_test_path, notice: 'Test was successfully updated'
    else
      render :edit
    end
  end

  def new
    @test = Test.new
  end

  def create
    @test = current_user.created_tests.new(test_params)
    if @test.save
      redirect_to admin_test_path(@test), notice: 'Test was saved'
    else
      render :new
    end
  end

  def destroy
    @test.destroy
    redirect_to admin_tests_path, notice: 'Test was successfully deleted'
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :author_id)
  end
end
