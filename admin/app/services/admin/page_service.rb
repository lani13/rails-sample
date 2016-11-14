module Admin
  class PageService
    include Godmin::Resources::ResourceService

    attrs_for_index :title, :url, :language, :meta_description, :meta_title, :active
    attrs_for_show :title, :url, :language, :meta_description, :meta_title, :active
    attrs_for_form :title, :url, :language, :page_content, :meta_description, :meta_title, :active
  end
end
