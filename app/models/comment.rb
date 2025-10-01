class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :article

  validates :content, presence: true, length: { minimum: 3 }
end
