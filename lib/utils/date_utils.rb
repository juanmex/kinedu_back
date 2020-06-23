module DateUtils
  class << self
    def distance_in_months(minor_date, major_date)
      (major_date.month - minor_date.month) + 12 * (major_date.year - minor_date.year)
    end

    def distance_in_minutes(minor_date, major_date)
      ((major_date - minor_date) / 60).ceil
    end
  end
end
