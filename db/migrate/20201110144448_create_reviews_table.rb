class CreateReviewsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.references :user
      t.references :song
      t.integer :rating
      t.text :content
    end
  end
end
