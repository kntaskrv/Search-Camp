# frozen_string_literal: true

module Users
  class Filter < BaseServiceApplication
    param :age_type

    AGE_TYPES = { "1" => 'Child', "2" => 'Adult' }.freeze

    def call
      users = User.all
      users = users.where(type: AGE_TYPES[age_type]) if AGE_TYPES[age_type]
      users
    end
  end
end
