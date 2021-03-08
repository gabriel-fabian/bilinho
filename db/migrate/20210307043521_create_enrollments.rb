class CreateEnrollments < ActiveRecord::Migration[6.0]
  def change
    create_table :enrollments do |t|
      t.string :course_name, null: false
      t.decimal :full_price, null: false
      t.integer :installments, null: false
      t.integer :payday, null: false
      t.references :educational_institution, null: false, foreign_key: true
      t.references :student, null: false, foreign_key: true

      t.timestamps
    end
  end
end
