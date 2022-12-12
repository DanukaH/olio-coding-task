class User < ApplicationRecord
  has_many :likes
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i

  validates :email, presence: true,
            format: { with: EMAIL_REGEX, message: 'Invalid Email' },
            uniqueness: { case_sensitive: false },
            length: { minimum: 4, maximum: 254 },
            confirmation: true

  def full_name
    "#{first_name} #{last_name}"
  end
end
