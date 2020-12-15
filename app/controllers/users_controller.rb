class UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
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
