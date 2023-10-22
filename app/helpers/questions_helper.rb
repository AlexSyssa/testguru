module QuestionsHelper

  TITLES = {new: 'Create new', edit: 'Edit'}.freeze
  def question_header(question)
      "#{TITLES[action_name.to_sym]} #{question.test.title} question"
  end
end
