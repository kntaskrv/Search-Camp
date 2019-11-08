# frozen_string_literal: true

module Admin
  class CommentsController < ApplicationController
    def index
      @comments = Comment.all
    end

    def show; end

    def create
      @comment = entity.comments.create(comment_params)
      if user_role.positive?
        redirect_to admin_season_path(@comment.season)
      else
        redirect_to season_path(@comment.season)
      end
    end

    private

    def user_role
      User.roles[current_user.role]
    end

    def comment_params
      params.require(:comment).permit(:message, :season_id, :user_id)
    end

    def entity
      @entity ||= Season.find(params[:season_id])
    end
  end
end
