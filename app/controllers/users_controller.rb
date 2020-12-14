class UsersController < ApplicationController
  def create
    if User.create(user_params)
      render json: {results: true}
    else
      render json: {results: false}
    end
  end

  private
  # TODO: require(:user)をするとpassword, password_confirmationが受け取れない問題を修正する
  def user_params
    params.permit(:name, :password, :password_confirmation)
  end
end
