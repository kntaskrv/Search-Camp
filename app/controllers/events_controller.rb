# frozen_string_literal: true

class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    event
  end

  def members
    @users = event.users
  end

  private

  def event
    @event = Event.find(params[:id])
  end
end
