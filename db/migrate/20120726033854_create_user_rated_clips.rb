class CreateUserRatedClips < ActiveRecord::Migration
  def change
    create_table :user_rated_clips do |t|
      t.integer :user_id
      t.integer :clip_id
      t.integer :rating, :defult => 0

      t.timestamps
    end
    add_index :user_rated_clips, :user_id
    add_index :user_rated_clips, :clip_id
  end
end
