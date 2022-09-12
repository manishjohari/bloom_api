class Api::Admin::V1::LensesController < Api::Admin::BaseController
  skip_before_action :authenticate_user!, only: [:index]

  load_and_authorize_resource

  def index
  end
end
