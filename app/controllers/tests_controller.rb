class TestsController < ApplicationController
  before_action :find_test, only: %i[show]

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
    test = Test.new(test_params)
    if @test.save
      render inline: '<p>Test: <%= @test.title %>! was save </p>'
    else
      render html: '<h1> Test was not save </h1>'.html_safe
    end
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level)
  end
end
