class CreateParents < ActiveRecord::Migration
  def change
    create_table :parents do |t|
      t.string :name
      t.string :email
      t.references :student, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :parents, [:student_id, :created_at]
  end
end
