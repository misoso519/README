class AddCategoryIdToQuestions < ActiveRecord::Migration[7.2]
  def change
    add_column :questions, :category_id, :integer
  end
end
