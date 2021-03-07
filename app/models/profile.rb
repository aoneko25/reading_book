class Profile < ApplicationRecord
  validates :terget, :hobby, :favorite_book,presence: true
  belongs_to :user

end
