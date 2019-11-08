# frozen_string_literal: true

module Admin
  class AttachmentsController < ApplicationController
    before_action :authenticate_user!

    def index
      @attachments = season.attachments
    end

    def new
      @attachment = Attachment.new
    end

    def create
      Attachments::Add.call(season, params[:images])
      redirect_to admin_season_attachments_path
    end

    private

    def season
      @season ||= Season.find(params[:season_id])
    end
  end
end
