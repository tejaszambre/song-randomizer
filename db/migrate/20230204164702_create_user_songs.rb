class CreateUserSongs < ActiveRecord::Migration[6.0]
  def change
    create_table :user_songs do |t|
      t.references :user, null: false, foreign_key: true
      t.references :song, null: false, foreign_key: true

      t.timestamps
    end
  end
end
