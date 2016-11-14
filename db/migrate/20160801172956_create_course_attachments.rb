class CreateCourseAttachments < ActiveRecord::Migration[5.0]
  def change
    create_table :course_attachments do |t|
      t.string :name
      t.string :attachment
      t.references :course, index: true, foreign_key: true

      t.timestamps
    end
  end
end
