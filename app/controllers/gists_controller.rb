class GistsController < ApplicationController

before_action :authenticate_user!

  def create
    @test_passage = TestPassage.find(params[:id])
    result = GistQuestionService.new(@test_passage.current_question)
    gist = result.call

    flash_options = if result.success?
      current_user.gists.create(question: @test_passage.current_question, url: gist.url)
      { notice: t('.success', link: gist.html_url) }
    else
      { alert: t('.failure') }
    end

    redirect_to @test_passage, flash_options
  end

end
