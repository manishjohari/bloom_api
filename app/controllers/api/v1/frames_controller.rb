class Api::V1::FramesController < Api::BaseController

  skip_before_action :authenticate_user!, only: [:index]

  load_and_authorize_resource

  def index
    render json: Frame.active, each_serializer: FrameSerializer
  end

end
