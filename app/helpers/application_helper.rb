module ApplicationHelper
  def user_logged?
    session[:user_id] != nil
  end
end
