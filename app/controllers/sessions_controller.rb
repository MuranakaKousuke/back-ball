class SessionsController < ApplicationController
  def create
    team = Team.find_by(email: session_params[:email])

    if team&.authenticate(session_params[:password])
      render json: { login: true, id: team.id, email: team.email }
    else
      render json: { login: false }
    end
  end

  def destroy
    render json: { login: false }
  end

  private
  def session_params
    params.permit(:email, :password)
  end
end
