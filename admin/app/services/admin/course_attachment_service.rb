module Admin
  class CourseAttachmentService
    include Godmin::Resources::ResourceService

    attrs_for_index :name, :attachment
    attrs_for_show :name, :attachment, :course
    attrs_for_form :name, :attachment, :course
  end
end
