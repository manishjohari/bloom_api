class Api::Admin::V1::SessionsController < Api::Admin::BaseController
  skip_before_action :authenticate_user!, raise: false

  def create
    # api will require email and password
    user = User.find_by(email: create_params[:email].downcase)
    if user&.valid_password?(create_params[:password])
      status = 200
      user.reset_authentication_token!
      render json: { user: user.user_info }, status: 201
    else
      status = 401
      render json: { error: 'The email or password you entered is incorrect.' }, status: status
    end
  end

  private

  def create_params
    params.require(:user).permit(:email, :password)
  end

end
