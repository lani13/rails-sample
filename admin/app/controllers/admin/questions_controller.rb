require_dependency 'admin/application_controller'

module Admin
  class QuestionsController < ApplicationController
    include Godmin::Resources::ResourceController

    helper_method :get_enums
    before_action :load_subresources, only: :show
    before_action :load_upresources, only: :new
    before_action :create_resource, only: :new
    
    def create_resource
      @resource = Question.create(course_id: params[:course_id]) if params[:course_id]
    end
    
    def create
      params.permit!
      respond_to do |format|
        if params[:course_id]
          @course = Course.find(params[:course_id])
          @resource = @course.questions.build(params[:question])
        else
          @resource = Question.new(params[:question])
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

    def get_enums(name)
      enums_name = name.to_s.pluralize
      @resource.class.send(enums_name)
    end
    
    def load_upresources
      @upresource = Course.find(params[:course_id]) if params[:course_id]
    end
    
    def load_subresources
      @subresource_service = Admin::AnswerService.new
      @subresources = @resource.answers
      @path = new_question_answer_path(@resource)
      @model = t("activerecord.models.answer")
    end
    
    def redirect_after_destroy
      course_path(@resource.course)
    end
    
    def redirect_after_error
      if params[:course_id]
        new_course_question_path(@resource.course)
      else
        new_question_path(@resource)
      end
    end
  end
end
