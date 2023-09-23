module QuestionsHelper

  TITLES = {new: 'Create new', edit: 'Edit'}.freeze
  def question_header(test)
      "#{TITLES[action_name.to_sym]} #{test.title} question"
  end
end
