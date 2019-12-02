class Post < ApplicationRecord
  belongs_to :author
  has_many :comments

  def self.newest_first
    order(created_at: :desc)
  end
end
