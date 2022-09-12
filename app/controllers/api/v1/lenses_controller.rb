class Api::V1::LensesController < Api::BaseController
  skip_before_action :authenticate_user!, only: [:index]

  load_and_authorize_resource

  def index
    render json: Lense.all, each_serializer: LenseSerializer
  end
  
end
