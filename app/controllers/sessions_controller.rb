class SessionsController < ApplicationController
  def create
    user = User.find_by(name: session_params[:name])

    if user&.authenticate(session_params[:password])
      render json: { login: true, id: user.id, name: user.name }
    else
      render json: { login: false }
    end
  end

  def destroy
    render json: { login: false }
  end

  private
  def session_params
    params.permit(:name, :password)
  end
end
