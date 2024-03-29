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
      redirect_to [:admin, @test], notice: t('.update')
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
      redirect_to [:admin, @test], notice: t('.success')
    else
      render :new
    end
  end

  def destroy
    @test.test_passages.delete_all
    @test.destroy
    redirect_to admin_tests_path, notice: t('.destroy')
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :author_id, :public)
  end
end
