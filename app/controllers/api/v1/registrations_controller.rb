class Api::V1::RegistrationsController < Api::BaseController
  skip_before_action :authenticate_user!, raise: false

  def create
    user = User.find_by(email: user_params[:email].downcase)
    unless user
      user = User.new(user_params)
      if user.save
        user.reset_authentication_token!
        render json: { user: user.user_info }, status: status
      else
        render json: { error: user.errors.full_messages }, status: 422
      end
    else
      status = 422
      render json: { error: 'The email is already taken.' }, status: status
    end
  end

  private

  def user_params
    params.require(:user).permit(:password, :email)
  end
end