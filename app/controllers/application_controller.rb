class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :not_found_response

  def create_resource(resource)
    if resource.valid?
      resource.save
      render :json => resource, :status => :created
    else
      render :json => { :message => "No es posible guardar el registro", :errors => resource.errors.full_messages }, :status => :bad_request
    end
  end

  def update_resource(resource, data)
    if resource.update(data)
      render :json => resource, :status => :no_content
    else
      render :json => { :message => "No es posible actualizar el registro", :errors => resource.errors.full_messages }, :status => :bad_request
    end
  end

  def not_found_response(exception)
    response = {
      message: "No se encontró el recurso solicitado",
      errors: [],
    }
    render :json => response, status: :not_found
  end
end
