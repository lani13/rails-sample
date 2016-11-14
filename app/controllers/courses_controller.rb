class CoursesController < ApplicationController
  layout 'course'

  def show
    @course = Course.where(status: :active).first #find(params[:id])
    raise ActiveRecord::RecordNotFound unless @course
    
    current_question_number = 1
    current_question_number = params[:question_number].to_i - 1 if params[:question_number]
    @question = @course.questions.find_nth(current_question_number)
    @next_question_number = @course.questions.find_nth(current_question_number + 1) # @TODO move it to model
    raise ActiveRecord::RecordNotFound unless @question
  end
end
