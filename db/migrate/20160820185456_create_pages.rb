class CreatePages < ActiveRecord::Migration[5.0]
  def change
    create_table :pages do |t|
      t.references :language, index: true
      t.string :title
      t.string :url
      t.string :page_content
      t.string :meta_description
      t.string :meta_title
      t.boolean :active

      t.timestamps
    end
  end
end
