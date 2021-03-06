class CreateEducationalInstitutions < ActiveRecord::Migration[6.0]
  def change
    create_table :educational_institutions do |t|
      t.string :name
      t.string :cnpj
      t.string :institution_type

      t.timestamps
    end
  end
end
