class AdminUser < ApplicationRecord
  include Godmin::Authentication::User
  
  def self.login_column
    :email
  end
  
  def to_s
    email
  end
end
