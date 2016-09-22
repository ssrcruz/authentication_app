class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :parent_name
      t.string :parent_email
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :students, [:user_id, :created_at]
  end
end
