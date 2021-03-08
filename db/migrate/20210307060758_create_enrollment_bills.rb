class CreateEnrollmentBills < ActiveRecord::Migration[6.0]
  def change
    create_table :enrollment_bills do |t|
      t.string :status, null: false
      t.decimal :value, null: false
      t.datetime :due_date, null: false
      t.references :enrollment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
