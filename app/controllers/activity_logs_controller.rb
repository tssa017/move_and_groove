class ActivityLogsController < ApplicationController
  before_action :find_activity_log, only: [:update, :destroy, :edit]

  def index
    @activity_logs = current_user.activity_logs.includes(:activity)
  end

  def new
    @activity_log = ActivityLog.new
  end

  def create
    @activity_log = current_user.activity_logs.build(activity_log_params)
    if @activity_log.save
      redirect_to root_path, notice: 'Activity logged successfully.'
    else
      flash.now[:alert] = 'Error logging activity.'
      render :new
    end
  end

  def show
    @activity_log = current_user.activity_logs.find(params[:id])
  end

  def update
    if @activity_log.update(log_update_params)
      redirect_to root_path, notice: 'Activity log updated successfully.'
    else
      render :edit
    end
  end

  def destroy
    @activity_log.destroy
    redirect_to activity_logs_path, notice: 'Activity log deleted successfully.'
  end

  private

  def activity_log_params
    params.require(:activity_log).permit(:date, :duration, :repetitions, :notes, :activity_id)
  end

  def log_update_params
    params.require(:activity_log).permit(:duration, :repetitions, :notes)
  end

  def find_activity_log
    @activity_log = current_user.activity_logs.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: 'Activity log not found.'
  end
end