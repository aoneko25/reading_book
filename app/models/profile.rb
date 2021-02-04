class Profile < ApplicationRecord
  validates :terget, :favorite_book, :recommended_book, presence: true
  belongs_to :user

end
