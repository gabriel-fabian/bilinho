class Api::V1::EnrollmentBillsController < Api::V1::ApiController


  def index

    @enrollment_bills = EnrollmentBill.order('created_at DESC')

    render json: {
      status: 'SUCCES',
      message: 'Enrollment bills loaded',
      data: @enrollment_bills.as_json
    }, status: :ok

  end

  def show

    @enrollment_bill = EnrollmentBill.find(params[:id])

    render json: {
      status: 'SUCCES',
      message: 'Enrollment bill loaded',
      data: @enrollment_bill.as_json
    }, status: :ok

  end
end

