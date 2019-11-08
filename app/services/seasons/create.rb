module Seasons
  class Create < BaseServiceApplication
    param :params

    def call
      validate
      return self unless valid?

      season.save
      self.result = season
      self
    end

    private

    def validate
      if season.date_start && season.date_end
        errors.add(:base, 'end date cannot be less than start date') if wrong_dates?
        errors.add(:base, 'start date cannot be less than current') unless dates_valid?
      end
      errors.merge_with_models(season) unless season.valid?
    end

    def wrong_dates?
      season.date_start > season.date_end
    end

    def dates_valid?
      now = Date.current
      now <= season.date_start
    end

    def season
      @season ||= Season.new(params)
    end
  end
end
