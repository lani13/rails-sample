class HomeController < ApplicationController
  def index
    @courses = Course.where(status: :active)
  end
end
