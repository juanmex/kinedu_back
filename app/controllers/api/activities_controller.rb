class Api::ActivitiesController < ApplicationController
  def index
    @activities = Activity.all
    render :json => @activities, :status => :ok
  end
end
