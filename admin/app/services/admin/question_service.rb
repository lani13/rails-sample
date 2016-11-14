module Admin
  class QuestionService
    include Godmin::Resources::ResourceService

    attrs_for_index :name, :question_type
    attrs_for_show :name, :description, :course, :status, :question_type
    attrs_for_form :name, :description, :course, :status, :question_type, :question_content
  end
end
