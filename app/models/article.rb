class Article < ApplicationRecord
 belongs_to :user
 has_many :comments, dependent: :destroy
 has_many_attached :photos

 validates :title, presence: true
 validates :content, presence: true, length: { minimum: 10 }
end
