require_dependency "admin/application_controller"

module Admin
  class AdminUsersController < ApplicationController
    include Godmin::Resources::ResourceController
  end
end
