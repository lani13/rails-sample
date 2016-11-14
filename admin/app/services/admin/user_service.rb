module Admin
  class UserService
    include Godmin::Resources::ResourceService

    attrs_for_index :first_name, :last_name, :birth_day, :email
    attrs_for_show :first_name, :last_name, :birth_day, :email
    attrs_for_form :first_name, :last_name, :birth_day, :email
  end
end
