require_dependency "admin/application_controller"

module Admin
  class PagesController < ApplicationController
    include Godmin::Resources::ResourceController
    before_action :create_resource, only: :new
    
    def create_resource
      l = Language.where(name: I18n.locale).first
      @resource = Page.create(language: l)
    end
  end
end
