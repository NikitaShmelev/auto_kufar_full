class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable
  # def gravatar_url
  #   gravatar_id = Digest::MD5::hexdigest(email).downcase
  #   "https://gravatar.com/avatar/#{gravatar_id}.png"
  # end
  validates :email, uniqueness: true, presence: true
  validates :first_name, uniqueness: false, presence: true
  validates :second_name, uniqueness: false, presence: true
end
