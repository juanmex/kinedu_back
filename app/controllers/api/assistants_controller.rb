class Api::AssistantsController < ApplicationController
  def index
    @assistants = Assistant.all
    render :json => @assistants, :status => :ok
  end
end
