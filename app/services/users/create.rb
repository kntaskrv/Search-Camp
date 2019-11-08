# frozen_string_literal: true

module Users
  class Create
    def self.call(params)
      @user = User.new(params)
    end
  end
end
