class Question < ApplicationRecord  
  belongs_to :course
  has_many :answers

  enum status: {'disabled':1,'preview':2,'active':3}
  enum question_type: {'question':1,'q_content':2}

  def to_s
	  name
  end
end
