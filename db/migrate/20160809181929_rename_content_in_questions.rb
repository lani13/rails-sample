class RenameContentInQuestions < ActiveRecord::Migration[5.0]
  def change
    rename_column :questions, :content, :question_content
  end
end
