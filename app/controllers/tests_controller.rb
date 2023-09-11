class TestsController < ApplicationController
  before_action :find_test

  def index
    result = ["Class: #{params.class}", "Parameters: #{params.inspect}"]
    render plain: result.join("\n")
  end

  def show
    render inline: '<%= @test.title %>'
  end

  def new
  end

  def create
    test = Test.create(test_params)
    render plain: test.inspect
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level)
  end
end
