class Page < ApplicationRecord
  belongs_to :language

  def to_s
    title
  end
end
