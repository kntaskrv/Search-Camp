# frozen_string_literal: true

class SeasonsController < ApplicationController
  def index
    @seasons = Season.all
  end

  def show
    season
  end

  def events
    @events = season.events
  end

  def staff
    @users = season.adults
  end

  private

  def season_params
    params.require(:season).permit(:name, :location, :date_start, :date_end)
  end

  def season
    @season = Season.find(params[:id])
  end
end
