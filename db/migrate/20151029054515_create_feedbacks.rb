class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.references :user, index: true
      t.integer :rate
      t.text :comment
      t.references :goal, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
