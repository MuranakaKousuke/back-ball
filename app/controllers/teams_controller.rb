class TeamsController < ApplicationController
  def create
    team = Team.new(team_params)
    if team.save
      render json: {results: true}
    else
      render json: {results: false}
    end
  end

  private
  # TODO: require(:team)をするとpassword, password_confirmationが受け取れない問題を修正する
  def team_params
    params.permit(:email, :password, :password_confirmation)
  end
end