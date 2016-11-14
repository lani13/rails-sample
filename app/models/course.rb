class Course < ApplicationRecord
  validates :since_activation, numericality: true
  validates :since_started, numericality: true
  validates :price, numericality: true

  has_many :questions
  has_many :course_attachments
  belongs_to :language

  has_and_belongs_to_many :users

  accepts_nested_attributes_for :course_attachments

  enum status: {'disabled':1,'preview':2,'active':3}

  def to_s
    name
  end

  def active?
    self.status == active
  end

  def has_questions_and_answers?
    self.questions.each do |question|
      return false if question.answers.size == 0
    end.empty?
      return false
    true
  end
end
