module Admin
  class CourseService
    include Godmin::Resources::ResourceService

    attrs_for_index :name, :language
    attrs_for_show :name, :price, :language, :short_description, :description, :status, :since_activation, :since_started
    attrs_for_form :name, :price, :language, :short_description, :description, :status, :since_activation, :since_started, :group
  end
end
