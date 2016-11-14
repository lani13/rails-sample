class CourseAttachment < ApplicationRecord  
  mount_uploader :attachment, AttachmentUploader
  belongs_to :course

  def to_s
	  name
  end
end
