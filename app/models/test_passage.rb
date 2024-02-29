class TestPassage < ApplicationRecord
  SUCCESSFUL_RESULT = 85.freeze

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :next_question
  before_update :passage_result!

  scope :success, -> {where(success: true)}

  def successful?
    correct_percent >= SUCCESSFUL_RESULT
  end

  def completed?
    current_question.nil? || time_over?
  end

  def complete_test
    self.current_question = nil
  end

  def correct_percent
    (100.00 * correct_questions) / test.questions.count
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end
    save!
  end

  def time_test
    (test.timer * 60) - (Time.now.to_i - created_at.to_i)
  end

  def time_over?
    time_test <= 0 if test.timer
  end

  def current_question_number
    test.questions.order(:id).where('id <= ?', (current_question.id)).count
  end

  private

  def next_question

    self.current_question = if new_record?
      test.questions.order(:id).first if test.present?
    else
      test.questions.order(:id).where('id > ?', current_question.id).first
    end
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.to_a.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def passage_result!
    self.success = self.successful? if self.completed?
  end
end
