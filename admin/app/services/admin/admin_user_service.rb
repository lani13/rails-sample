module Admin
  class AdminUserService
    include Godmin::Resources::ResourceService

    attrs_for_index :email
    attrs_for_show :email
    attrs_for_form :email, :password
  end
end
