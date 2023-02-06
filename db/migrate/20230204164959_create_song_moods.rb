class CreateSongMoods < ActiveRecord::Migration[6.0]
  def change
    create_table :song_moods do |t|
      t.references :song, null: false, foreign_key: true
      t.references :mood, null: false, foreign_key: true

      t.timestamps
    end
  end
end
