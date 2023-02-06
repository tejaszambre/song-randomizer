class SongMood < ApplicationRecord
  belongs_to :song
  belongs_to :mood
end
