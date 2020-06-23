class Api::BabiesController < ApplicationController
  def index
    @babies = Baby.all
    render :json => @babies, :status => :ok
  end
end
