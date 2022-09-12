class Api::Admin::BaseController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  skip_before_action :verify_authenticity_token

  before_action :reset_session, :authenticate_user!

  def authenticate_user!(options = {})
    head :unauthorized unless signed_in?
  end

end
