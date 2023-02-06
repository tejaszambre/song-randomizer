class User < ApplicationRecord
  has_many :user_songs
  has_many :songs, through: :user_songs
  has_many :user_moods
  has_many :moods, through: :user_moods

  validates :name, :email, presence: true
end
