class Api::V1::GlassesController < Api::BaseController

  def new
    glass = current_user.glasses.build(glass_params)
    render json: { glass: GlassSerializer.new(glass) }
  end

  def create
    glass = current_user.glasses.build(glass_params)
    if glass.save
      render json: { glass: GlassSerializer.new(glass) }
    else
      render json: { error: glass.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def glass_params
    params.require(:glasses).permit(:lense_id, :frame_id)
  end

end
