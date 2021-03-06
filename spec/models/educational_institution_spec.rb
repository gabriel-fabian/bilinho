require 'rails_helper'

# Only a test for RSpec, will be doing real tests in near future
RSpec.describe EducationalInstitution, type: :model do

  context 'validations' do
    context 'name' do
      it 'ensure presence of name' do
        record = EducationalInstitution.new
        record.name = ''
        record.validate
        expect(record.errors[:name]).to include("can't be blank")
      end
    end

    context 'cnpj' do
      it 'ensure presence of cnpj' do
        record = EducationalInstitution.new
        record.cnpj = ''
        record.validate
        expect(record.errors[:cnpj]).to include("can't be blank")
      end

      it 'ensure cnpj is a number' do
        record = EducationalInstitution.new
        record.cnpj = 'number'
        record.validate
        expect(record.errors[:cnpj]).to include("is not a number")
      end
    end
  end
end

