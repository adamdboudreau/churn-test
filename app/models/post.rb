class Post < ApplicationRecord
  validates :content, length: { maximum: 255 }
end
