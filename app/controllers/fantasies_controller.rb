class FantasiesController < ApplicationController
  def new
    @team = Team.find(params[:team_id])
    @fantasy = Fantasy.new
  end

  def create
    @team = Team.find(params[:team_id])
    @fantasy = Fantasy.new(fantasy_params)
    @fantasy.team_id = @team.team_id
    @fantasy.player_id = params[:fantasy][:player_id].to_i
    if @fantasy.save
      redirect_to team_path(@fantasy.team_id)
    else
      render :new
  end

  def destroy
    @fantasy = Fantasy.find(params[:id])
    @fantasy.destroy
    redirect_to team_path(@fantasy.team_id)
  end

  private

  def fantasy_params
    params.require(:fantasy).permit(:team_id, :player_id)
  end
end
