require "utils/date_utils"

class ActivityLog < ApplicationRecord
  before_update :update_duration

  validates :start_time, presence: true
  validate :check_stop_time

  belongs_to :baby
  belongs_to :assistant
  belongs_to :activity

  scope :with_info, -> {
          joins(:baby, :assistant, :activity)
            .includes(:baby, :assistant, :activity)
            .order("activity_logs.start_time DESC")
        }

  scope :by_baby, ->(baby_id) {
      where(baby_id: baby_id)
    }

  scope :by_assistant, ->(assistant_id) {
          where(assistant_id: assistant_id)
        }

  scope :by_status, ->(status) {
          case status
          when "complete"
            where("activity_logs.stop_time is not null")
          when "in_progress"
            where("activity_logs.stop_time is null")
          end
        }

  def check_stop_time
    if stop_time.present? && stop_time < start_time
      errors.add(:stop_time, "can't be lower than start_time")
    end
  end

  def update_duration
    if stop_time.present?
      self.duration = DateUtils.distance_in_minutes(start_time, stop_time)
    end
  end
end
