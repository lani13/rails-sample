class User < ApplicationRecord
  validates :first_name, :last_name, :birth_day, :email, presence: true
  validates :email, format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :email, uniqueness: true

  has_secure_password

  # has_and_belongs_to_many :courses
  def to_s
    "#{first_name} #{last_name}"
  end

  def self.generate_random_string(string = %w(A V C M N T U W X Y 3 4 P), length = 8)
    chars = string.shuffle
    (0...length).map {chars[rand(chars.size)]}.join
  end
end
