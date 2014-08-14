class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text     :review_text
      t.integer  :reviewer_user_id
      t.integer  :reviewee_user_id
      t.timestamps
    end
  end
end
