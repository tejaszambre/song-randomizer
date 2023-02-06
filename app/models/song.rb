class Song < ApplicationRecord
  has_many :user_songs
  has_many :users, through: :user_songs
  has_many :song_moods
  has_many :moods, through: :song_moods

  validates :title, :artist, :genre, presence: true
  validates :title, uniqueness: { scope: :artist }
end
