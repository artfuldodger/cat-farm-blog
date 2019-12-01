class Author < ApplicationRecord
  devise :database_authenticatable, :rememberable, :validatable,
         :lockable, :trackable
end
