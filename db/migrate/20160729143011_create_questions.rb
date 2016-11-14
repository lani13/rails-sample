class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.string :name
      t.string :description
      t.integer :status
      t.references :course, index: true, foreign_key: true
      t.integer :question_type
      
      t.timestamps
    end
  end
end
