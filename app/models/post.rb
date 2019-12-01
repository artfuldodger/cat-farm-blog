class Post < ApplicationRecord
  belongs_to :author

  def self.newest_first
    order(created_at: :desc)
  end
end
