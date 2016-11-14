class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.string :name
      t.decimal :price, precision: 10, scale: 2, default: 0.00
      t.text :short_description
      t.text :description
      t.string :group
      t.references :language, index: true, foreign_key: true
      t.integer :status
      t.integer :since_activation, default: 0
      t.integer :since_started, default: 0

      t.timestamps
    end
  end
end
