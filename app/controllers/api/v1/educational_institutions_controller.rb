class Api::V1::EducationalInstitutionsController < Api::V1::ApiController

  def index

    @institutions = EducationalInstitution.order('created_at DESC');
    render json: { 
      status: 'SUCCESS',
      message: 'Institutions Loaded',
      data: @institutions.as_json
    }, status: :ok

  end

  def show

    @institution = EducationalInstitution.find(params[:id])
    render json: {
      status: 'SUCCESS',
      message: 'Insitution loaded',
      data: @institution.as_json
    }, status: :ok

  end

  def create

    @institution = EducationalInstitution.new(institution_params)
    if @institution.save
      render json: {
        status: 'SUCCESS',
        message: 'Institution created',
        data: @institution.as_json
      }, status: :ok
    else
      render json: {
        status: 'ERROR',
        message: 'Failed to create Insitution',
        data: @institution.errors.as_json

      }, status: :unprocessable_entity
    end
  end

  private
  def institution_params
    params.permit(:name, :cnpj, :institution_type)
  end

end

