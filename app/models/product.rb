class Product < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :description, presence: true
  validates :address, presence: true
  validates :price, numericality: { only_integer: true}
  validates :price, comparison: { greater_than: 0}

  has_many_attached :images
end
