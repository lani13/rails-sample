require_dependency 'admin/application_controller'

module Admin
  class AnswersController < ApplicationController
    include Godmin::Resources::ResourceController

    before_action :load_upresources, only: :new
    
    def create
      params.permit!
      respond_to do |format|
        if params[:question_id]
          @question = Question.find(params[:question_id])
          @resource = @question.answers.build(params[:answer])
        else
          @resource = Answer.new(params[:answer])
        end
        
        if @resource.save
          format.html { redirect_to redirect_after_create, notice: redirect_flash_message }
          format.json { render :show, status: :created, location: @resource }
        else
          format.html { redirect_to redirect_after_error }
          format.json { render json: @resource.errors, status: :unprocessable_entity }
        end
      end
    end
    
    def load_upresources
      @upresource = Question.find(params[:question_id]) if params[:question_id]
    end
    
    def redirect_after_destroy
      question_path(@resource.question)
    end
    
    def redirect_after_error
      if params[:question_id]
        new_question_answer_path(@resource.question)
      else
        new_answer_path(@resource)
      end
    end
  end
end
