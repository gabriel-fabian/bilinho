class CreateEducationalInstitutions < ActiveRecord::Migration[6.0]
  def change
    create_table :educational_institutions do |t|
      t.string :name, null: false
      t.string :cnpj, null: false
      t.string :institution_type, null: false

      t.timestamps
    end
  end
end
