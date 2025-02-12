class CreateQuestions < ActiveRecord::Migration[7.2]
  def change
    create_table :questions do |t|
      t.string :title
      t.text :body
      t.references :user, null: false, foreign_key: true
      t.string :image
      t.string :video

      t.timestamps
    end
  end
end
