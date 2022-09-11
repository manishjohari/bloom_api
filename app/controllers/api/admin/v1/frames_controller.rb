class Api::Admin::V1::FramesController < Api::Admin::BaseController
  def index
    render json: Frame.active, each_serializer: FrameSerializer
  end

  def create
    frame = Frame.new(create_params)
    if frame.save
      render json: { frame: FrameSerializer.new(frame) }
    else
      render json: { error: frame.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def create_params
    params.require(:frames).permit(:name, :description, :stock, :currency_code, { prices_attributes: [:price, :currency_code] })
  end
end
