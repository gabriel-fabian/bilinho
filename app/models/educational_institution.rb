class EducationalInstitution < ApplicationRecord

  has_many :enrollments

  validates :name,
            presence: true,
            uniqueness: true

  validates :cnpj,
            presence: true,
            uniqueness: true,
            numericality: { only_integer: true }

  validates :institution_type,
            presence: true

  enum institution_type: { 
    Universidade: "Universidade",
    Escola: "Escola",
    Creche: "Creche"
  }

end

