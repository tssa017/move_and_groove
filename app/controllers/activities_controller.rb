class ActivitiesController < ApplicationController  
    def get_activity_type
      @activity = Activity.find(params[:id])
      render json: { type_of_activity: @activity.type_of_activity }
    end

    def index
      @activities = Activity.all
    end
  end