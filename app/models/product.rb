class Product < ActiveRecord::Base
  validates :title, presence: {message: 'nie może być puste' }
  validates :title, length: {minimum: 4}, uniqueness: true
  validates :price, presence: true
  validates :description, presence: true
end

