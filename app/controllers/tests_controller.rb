class TestsController < ApplicationController

  #/tests?level=2&lang=ru
 def index
   #byebug
   #result = ["Class: #{params.class}", "Parameters: #{params.inspect}"]
   #render plain: result.join("\n")
   #render  html: '<h1> All tests </h1>'.html_safe
   render json: {tests: Test.all}
   #render inline: '<p>My favorite language is: <%= "lala" %>!</p>'
   # НЕ РАБОТАЕТ!render file: 'public/about/author'
   # НЕ РАБОТАЕТ!render file: 'public/about/author', layout: false
   #head 204
   #head :no_content
   #byebug
   #render inline: '<%= console %>'
   #logger.info(self.object_id)

   #respond_to do |format|
   #  format.html { render plain: 'All tests'}
   #  format.json { render json: { tests: Test.all } }
 end

 def new
 end

 def create
  test = Test.create(test_params)

  render plain: test.inspect

  private

  def test_params
    params.require(:test).permit(:title, :level)
  end
 end

 def show
   redirect_to root_path
 end
end
