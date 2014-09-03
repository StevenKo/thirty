class CreateClips < ActiveRecord::Migration
  def change
    create_table :clips do |t|
      t.string :title
      t.text :discription
      t.string :url
      t.string :video_id
      t.boolean :is_hot, :defult => false
      t.integer :rating, :defult => 0
      t.timestamps
    end
  end
end
