class GistQuestionService

  def initialize(question, client: nil)

    #@client = GithubClient.new
    @question = question
    @test = @question.test
    @client = client || Octokit::Client.new(:access_token => "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")
    #Не работает
    # @client = client || Octokit::Client.new(access_token: ENV['GITHUB_TOKEN'])
  end

  def call
    @client.create_gist(gist_params)
  end

  def success?
    @client.last_response.status == 201
  end

  private

  def gist_params
    {
      description: I18n.t('services.description', test: @test.title),
      files: {
        "#{I18n.t('services.test_guru_question')}.txt" => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end
end
# description: I18n.t('services.description', test: @test.title)
