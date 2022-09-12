class Api::V1::LensesController < Api::BaseController
  skip_before_action :authenticate_user!, only: [:index]

  load_and_authorize_resource

  def index
  end

  def create
    frame = Frame.new(create_params)
    if frame.save
      render json: { frame: FrameSerializer.new(frame) }
    else
      render json: { error: frame.errors.full_messages }, status: :unprocessable_entity
    end
  end
  
end
