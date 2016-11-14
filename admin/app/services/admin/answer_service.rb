module Admin
  class AnswerService
    include Godmin::Resources::ResourceService

    attrs_for_index :name, :correct
    attrs_for_show :name, :correct
    attrs_for_form :name, :correct, :question
  end
end
