class EmployeesController < ApplicationController
  def index
    @employees = Unirest.get("#{ ENV["API_HOST"] }/api/v1/employees.json").body
  end

  def new
    
  end

  def create
    employee = Unirest.post(
                            "#{ ENV["API_HOST"] }/api/v1/employees.json",
                            headers: {
                                      "Accept" => "application/json"
                                      },
                            parameters: {
                                     first_name: params[:first_name],
                                     last_name: params[:last_name],
                                     email: params[:email]
                                    }
                            ).body

    redirect_to "/employees/#{employee["id"]}"
  end

  def show
    @employee = Employee.new(Unirest.get("#{ ENV["API_HOST"] }/api/v1/employees/#{params[:id]}.json").body)
  end

  def edit
    @employee = Unirest.get("#{ ENV["API_HOST"] }/api/v1/employees/#{params[:id]}.json").body
  end

  def update
    employee = Unirest.patch(
                            "#{ ENV["API_HOST"] }/api/v1/employees/#{params["id"]}.json",
                            headers: {
                                      "Accept" => "application/json"
                                      },
                            parameters: {
                                     first_name: params[:first_name],
                                     last_name: params[:last_name],
                                     email: params[:email]
                                    }
                            ).body

    redirect_to "/employees/#{employee["id"]}"
  end

  def destroy
    Unirest.delete(
                   "#{ ENV["API_HOST"] }/api/v1/employees/#{params["id"]}.json",
                   headers: {
                             "Accept" => "application/json"
                             }
                   ).body
    redirect_to "/employees"
  end
end
