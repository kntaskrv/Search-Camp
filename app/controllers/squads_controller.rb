class SquadsController < ApplicationController
  def index
    @squads = season&.squads || Squad.all
  end

  private

  def season
    @season ||= Season.find(params[:season_id])
  end
end
