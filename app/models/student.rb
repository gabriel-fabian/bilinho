class Student < ApplicationRecord

  validates :name,
    presence: true,
    uniqueness: true

  validates :cpf,
    presence: true,
    uniqueness: true,
    numericality: { only_integer: true}

  validates :phone,
    numericality: { only_integer: true}

  enum gender: {
    M: 'male',
    F: 'female'
  }

  enum payment_method: {
    Boleto: 'boleto',
    CreditCard: 'credit'
  }

end

