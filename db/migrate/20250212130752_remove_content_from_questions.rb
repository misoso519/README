class RemoveContentFromQuestions < ActiveRecord::Migration[7.2]
  def change
    remove_column :questions, :content, :string
  end
end
