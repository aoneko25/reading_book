class Book < ApplicationRecord
  validates :title, :author, :the_publisher, presence: true
  belongs_to :user
end
