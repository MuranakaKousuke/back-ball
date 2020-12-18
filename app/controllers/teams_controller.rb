class TeamsController < ApplicationController
  def create
    team = Team.new(team_create_params)
    if team.save
      render json: {
        results: true,
      }
    else
      render json: {
        results: false,
      }
    end
  end

  def update
    team = Team.find_by(id: params[:id])
    if team&.update(team_update_params)
      render json: {
        results: true,
        team: {
          id: team.id,
          name: team.name,
          town: team.town,
          introduction: team.introduction,
          prefectureId: team.prefecture_id,
        }
      }
    else
      render json: {
        results: false,
      }
    end
  end

  private
  # TODO: require(:team)をするとpassword, password_confirmationが受け取れない問題を修正する
  def team_create_params
    params.permit(:email, :password, :password_confirmation)
  end

  def team_update_params
    params.permit(:name, :prefecture_id, :town, :introduction)
  end
end