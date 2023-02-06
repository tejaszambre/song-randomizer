class Mood < ApplicationRecord
  has_many :song_moods
  has_many :songs, through: :song_moods
  has_many :user_moods
  has_many :users, through: :user_moods

  validates :name, presence: true, uniqueness: true
end
