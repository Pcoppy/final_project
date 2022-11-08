class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :editor
  has_many :authors
  has_many :books, through: :editors
  has_one :producer
  has_many :views, through: :producer, dependent: :destroy
  has_one_attached :photo
end
