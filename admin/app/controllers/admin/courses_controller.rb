require_dependency "admin/application_controller"

module Admin
  class CoursesController < ApplicationController
    include Godmin::Resources::ResourceController

    helper_method :get_enums
    before_action :load_subresources, only: :show

    def get_enums(name)
      enums_name = name.to_s.pluralize
      @resource.class.send(enums_name)
    end
    
    def load_subresources
      @subresource_service = Admin::QuestionService.new
      @subresources = @resource.questions
      @attachments_service = Admin::CourseAttachmentService.new
      @attachments = @resource.course_attachments
      @path = new_course_question_path(@resource)
      @model = t("activerecord.models.question")
    end
  end
end
