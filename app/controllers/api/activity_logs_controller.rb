class Api::ActivityLogsController < ApplicationController
  before_action :set_activity_log, :only => [:update, :show]

  def index
    @activity_logs = ActivityLog.with_info
    @activity_logs = @activity_logs.by_baby(params[:baby_id]) if params[:baby_id] && params[:baby_id] != "null"
    @activity_logs = @activity_logs.by_assistant(params[:assistant_id]) if params[:assistant_id].present?
    @activity_logs = @activity_logs.by_status(params[:status]) if params[:status].present?
    render :json => @activity_logs, :status => :ok
  end

  def create
    @activity_log = ActivityLog.new(activity_log_params)
    create_resource(@activity_log)
  end

  def update
    update_resource(@activity_log, activity_log_params)
  end

  def show
    render :json => @activity_log, :status => :ok
  end

  private

  def activity_log_params
    params.require(:activity_log).permit(:activity_id, :baby_id, :assistant_id, :start_time, :stop_time, :comments)
  end

  def set_activity_log
    @activity_log = ActivityLog.find(params[:id])
  end
end
