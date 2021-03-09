class Api::V1::StudentsController < Api::V1::ApiController

  def index

    @students = Student.order('created_at ASC').page(params[:page])

    render json: {
      status: 'SUCCESS',
      message: 'Students loaded',
      data: @students.as_json
    }, status: :ok

  end

  def show

    @student = Student.find(params[:id])

    render json: {
      status: 'SUCCESS',
      message: 'Student loaded',
      data: @student.as_json
    }, status: :ok
  end

  def create

    @student = Student.new(student_params)

    if @student.save

      render json: {
        status: 'SUCCESS',
        message: 'Student created',
        data: @student.as_json
      }, status: :ok
    else

      render json: {
        status: 'ERROR',
        message: 'Error creating user',
        data: @student.errors.as_json
      }, status: :unprocessable_entity

    end
  end

  private
  def student_params
  params.permit(
    :name,
    :cpf,
    :birthday,
    :phone,
    :gender,
    :payment_method
  )
  end
end

