require 'rails_helper'
require 'active_support/testing/time_helpers'

RSpec.describe Enrollment, type: :model do
  include ActiveSupport::Testing::TimeHelpers

  describe "#create_enrollment_bills" do
    let(:reference_date) { Time.zone.local(2021, 02, 15) }
    let(:educational_institution) { EducationalInstitution.create!(name: "Foo", cnpj: "12345", institution_type: :Universidade) }
    let(:student) { Student.create!(name: "FooBar", cpf: "12345", gender: :M, payment_method: :CreditCard) }
    let(:enrollment) { Enrollment.create!(course_name: "Medicina", full_price: 240000, installments: 3, payday: 31, educational_institution_id: educational_institution.id, student_id: student.id, created_at: reference_date) }

    context "When enrollment is created" do
      it "does create its enrollment bills" do
        expect( enrollment.enrollment_bills.count ).to be_eql(enrollment.installments)
      end
    end

    context "Validate enrollment bills" do
      it "does have the correct value" do
        expect( enrollment.enrollment_bills.first.value).to be_eql(enrollment.full_price/enrollment.installments)
      end

      it "does have due date one month apart" do
        expect( enrollment.enrollment_bills[1].created_at.month).to be_eql(reference_date.next_month.month)
      end

      context "When payday is the last possible day" do
        it "sets due date to last day in month" do
          expect( enrollment.enrollment_bills.first.due_date.day ).to be_eql( 28 )
        end
      end

      context "When payday was set before enrollment creation" do
        let(:enrollment_new) { Enrollment.create!( course_name: "Administração", full_price: 240000, installments: 3, payday: 10, educational_institution_id: educational_institution.id, student_id: student.id, created_at: reference_date) }

        it "does set due date to next month" do
          expect( enrollment_new.enrollment_bills.first.due_date.month ).to be_eql( reference_date.next_month.month )
        end
      end
    end
  end
end
