class Enrollment < ApplicationRecord

  after_create :create_enrollment_bills

  belongs_to :educational_institution, dependent: :destroy
  belongs_to :student, dependent: :destroy

  has_many :enrollment_bills

  validates :course_name,
    presence: true

  validates :full_price,
    numericality: { greater_than: 0 }

  validates :installments,
    numericality: { greater_than_or_equal_to: 1 }

  validates :payday,
    inclusion: { in: 1..32 }

  validates :educational_institution,
    presence: true

  validates :student,
    presence: true

  private
  def create_enrollment_bills

    date = self.created_at

    if self.payday <= date.day
      date = date.next_month
    end

    (1..self.installments).each do
      day_to_pay = self.payday
      last_day_in_month = Date.new(date.year, date.month, -1).day

      if day_to_pay > last_day_in_month
        day_to_pay = last_day_in_month
      end

      EnrollmentBill.create({
        :due_date => Date.new(date.year, date.month, day_to_pay),
        :value => self.full_price / self.installments,
        :enrollment => self,
        :status => "open"
      })

      date = date.next_month

    end
  end

end

