class EnrollmentBill < ApplicationRecord

  belongs_to :enrollment, dependent: :destroy

  validates :value,
    presence: true

  validates :due_date,
    presence: true

  validates :status,
    presence: true

  enum status: {
    Aberta: "open",
    Atrasada: "overdue",
    Paga: "paid"
  }
end

