class Flat < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  belongs_to :user
  has_many_attached :fotos
  has_many :comments, dependent: :destroy
  CATEGORIES = ["apartamento", "casa", "campo", "flat", "praia", "chale", "lago"]
  validates :category, presence: true, inclusion: { in: CATEGORIES.map { |category| category.capitalize }}
end
