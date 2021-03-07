class Api::V1::EnrollmentsController < Api::V1::ApiController

  def index

    @enrollments = Enrollment.order('created_at DESC')

    render json: {
      status: 'SUCCESS',
      message: 'Enrollments loaded',
      data: @enrollments.as_json
    }, status: :ok

  end

  def show

    @enrollment = Enrollment.find(params[:id])

    render json: {
      status: 'SUCCESS',
      message: 'Enrollment loaded',
      data: @enrollment.as_json
    }, status: :ok

  end

  def create

    @enrollment = Enrollment.new(enrollment_params)

    if @enrollment.save
      render json: {
        status: 'SUCCES',
        message: 'Enrollment created',
        data: @enrollment.as_json
      }, status: :ok
    end
  end

  private
  def enrollment_params
    params.permit(
      :course_name,
      :full_price,
      :installments,
      :due_date,
      :educational_institution_id,
      :student_id
    )
  end
end
