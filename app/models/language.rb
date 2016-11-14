class Language < ApplicationRecord
  has_many :courses
  has_many :pages
  
  def to_s
	  name
  end
end
