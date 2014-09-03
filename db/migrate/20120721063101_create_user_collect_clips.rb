class CreateUserCollectClips < ActiveRecord::Migration
  def change
    create_table :user_collect_clips do |t|
      t.integer :user_id
      t.integer :clip_id

      t.timestamps
    end

    add_index :user_collect_clips, :user_id
    add_index :user_collect_clips, :clip_id
  end
end
