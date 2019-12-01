class Author < ApplicationRecord
  devise :database_authenticatable, :rememberable, :validatable,
         :lockable, :trackable

  has_many :posts
end
