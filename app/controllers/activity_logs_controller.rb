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

  def is_duration_based
    # Define your logic here to determine if the activity is duration based or not
    # For example, if the activity has a duration but no repetitions, it might be duration-based
    # You should adjust this logic based on your specific requirements
    duration.present? && repetitions.blank?
  end

  def destroy
    @activity_log = ActivityLog.find(params[:id])

    if @activity_log.destroy
      redirect_to root_path, notice: 'Activity log deleted successfully.'
    else
      redirect_to root_path, alert: 'Failed to delete activity log.'
    end
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