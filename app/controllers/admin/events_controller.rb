# frozen_string_literal: true

module Admin
  class EventsController < ApplicationController
    before_action :authenticate_user!, only: %i[new create kick_user]
    before_action :load_event, only: %i[show edit update destroy kick_user]

    def index
      authorize Event
      @events = season&.events || Event.all
    end

    def show
      authorize @event
    end

    def new
      @event = Event.new
      authorize @event
    end

    def create
      @event = Event.new(event_params)
      authorize @event

      if @event.save
        redirect_to admin_event_path(@event)
      else
        render :new
      end
    end

    def edit
      authorize @event
    end

    def update
      authorize @event
      if @event.update(event_params)
        redirect_to admin_event_path(@event)
      else
        render :edit
      end
    end

    def destroy
      authorize @event
      @event.destroy
      redirect_to admin_events_path
    end

    def members
      @users = User.joins(:members).where('event_id = ?', params[:id])
    end

    def kick_user
      authorize current_user
      @event.users.delete(User.find(params[:user_id]))
      redirect_to members_admin_event_path
    end

    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    private

    def season
      @season ||= Season.find_by(id: params[:season_id])
    end

    def user_not_authorized
      redirect_to(request.referer || root_path, alert: 'You do not have rights')
    end

    def event_params
      params.require(:event).permit(:name, :location, :date, :season_id)
    end

    def load_event
      @event = Event.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to admin_events_path
    end
  end
end
