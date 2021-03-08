class CreateStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :students do |t|
      t.string :name, null: false
      t.string :cpf, null: false
      t.date :birthday
      t.string :phone
      t.string :gender, null: false
      t.string :payment_method, null: false

      t.timestamps
    end
  end
end
