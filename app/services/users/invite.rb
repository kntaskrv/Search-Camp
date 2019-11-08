# frozen_string_literal: true

module Users
  class Invite < BaseServiceApplication
    param :params

    def call
      user = User.invite!(params.to_hash) do |u|
        u.skip_invitation = true
      end
      user
    end
  end
end
