require_dependency "admin/application_controller"

module Admin
  class CourseAttachmentsController < ApplicationController
    include Godmin::Resources::ResourceController
  
    before_action :load_upresources, only: :new

    def create
      params.permit!
      respond_to do |format|
        if params[:course_id]
          @course = Course.find(params[:course_id])
          @resource = @course.course_attachments.build(
                                                       name: params[:course_attachment]['name'],
                                                       attachment: params[:course_attachment]['attachment']
                                                      )
        else
          @resource = CourseAttachment.create(
                                              name: params[:course_attachment]['name'],
                                              attachment: params[:course_attachment]['attachment'],
                                              course_id: params[:course_attachment]['course_id']
                                              )
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
      @upresource = Course.find(params[:course_id]) if params[:course_id]
    end
    
    def redirect_after_destroy
      course_path(@resource.course)
    end
    
    def redirect_after_error
      if params[:course_id]
        new_course_course_attachment_path(@resource.course)
      else
        new_course_attachment_path(@resource)
      end
    end
  end
end
