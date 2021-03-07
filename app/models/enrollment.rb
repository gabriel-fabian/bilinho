class Enrollment < ApplicationRecord
  belongs_to :educational_institution, dependent: :destroy
  belongs_to :student, dependent: :destroy

  validates :course_name,
    presence: true

  validates :full_price,
    numericality: { greater_than_or_equal_to: 1 }

  validates :installments,
    numericality: { greater_than_or_equal_to: 1 }

  validates :due_date,
    inclusion: { in: 1..32 }

  validates :educational_institution,
    presence: true

  validates :student,
    presence: true

end

