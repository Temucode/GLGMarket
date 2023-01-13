class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :products
  has_many :bought_products, through: :posts, source: :product, dependent: :destroy

  validates :name, :last_name, :address, :age, :email, :password, presence: true
  validates :email, uniqueness: true
end
