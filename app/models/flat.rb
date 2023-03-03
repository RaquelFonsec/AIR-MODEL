class Flat < ApplicationRecord
  belongs_to :user
  has_many_attached :fotos
  has_many :comments
end
