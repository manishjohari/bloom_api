class Api::Admin::V1::LensesController < Api::BaseController
  skip_before_action :authenticate_user!, only: [:index]

  load_and_authorize_resource

  def index
    render json: Lense.all, each_serializer: LenseSerializer
  end

  def create
    lense = Lense.new(create_params)
    if lense.save
      render json: { lense: LenseSerializer.new(lense) }
    else
      render json: { error: lense.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def create_params
    params.require(:lenses).permit(:colour, :description, :prescription_type, :lens_type, :stock, { prices_attributes: [:price, :currency_code] })
  end
end
