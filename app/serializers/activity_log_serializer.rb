class ActivityLogSerializer < ActiveModel::Serializer
  attributes :id, :start_time, :stop_time, :duration, :comments
  belongs_to :baby
  belongs_to :activity
  belongs_to :assistant
end
