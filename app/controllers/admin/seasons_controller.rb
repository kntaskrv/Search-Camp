# frozen_string_literal: true

module Admin
  class SeasonsController < ApplicationController
    before_action :check_policy

    def index
      @seasons = Season.all
    end

    def show
      season
    end

    def new
      @season = Season.new
    end

    def create
      @season = Seasons::Create.call(season_params)

      if @season.valid?
        redirect_to admin_season_path(@season.result)
      else
        render :new
      end
    end

    def edit
      season
    end

    def update
      if season.update(season_params)
        redirect_to admin_season_path(season)
      else
        render :edit
      end
    end

    def destroy
      season
      season.destroy
      redirect_to admin_seasons_path
    rescue ActiveRecord::RecordNotFound
      redirect_to admin_seasons_path
    end

    def events
      @events = season.events
    end

    def event_list
      season
      @events = Event.all
    end

    def add_event
      season.events << event unless season.events.include?(event)
      redirect_to events_admin_season_path
    end

    def delete_event
      season.events.destroy(Event.find(params[:id]))
      redirect_to events_admin_season_path
    end

    def staff
      @users = Season.find(params[:id]).adults
    end

    def adult_list
      season
      @users = Adult.all
    end

    def open_chat
      season.chat_opened = true
      season.save
      redirect_to admin_season_path(season)
    end

    def close_chat
      season.update(chat_opened: false)
      redirect_to admin_season_path(season)
    end

    def start_season
      if season.started
        redirect_to admin_season_path(season), alert: 'Season has already started'
      else
        season.update(started: true)
        Seasons::AddChildren.call(season, current_user)
      end
    end

    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    private

    def event
      @event ||= Event.find(params[:id])
    end

    def user_not_authorized
      redirect_to(request.referer || root_path, alert: 'You do not have rights')
    end

    def check_policy
      authorize Season
    end

    def season_params
      params.require(:season).permit(:name, :location, :date_start, :date_end)
    end

    def season
      @season ||= Season.find(params[:id])
    end
  end
end
