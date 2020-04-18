class AppointmentsController < ApplicationController

  before_action :login_required
  #before_action :find_appointment_client, only: [:index, :show]
  
  def index
    if params[:client_id]
      client = Client.find_by(id:params[:client_id])
    if current_client == client
      @appointments = client.appointments.alpha
    else
      flash[:alert] = "Client not found."
      redirect_to clients_path
    end
    else
      @appointments = Appointment.all.alpha.includes(:client, :treatment)
    end
  end

  def show
    if params[:client_id]
      client = Client.find_by(id:params[:client_id])
      @appointment = client.appointments.find_by(id:params[:id])
    if !@appointment
      flash[:alert] = "Appointment not found."
      redirect_to client_appointments_path(client)
    end
    else
      @appointment = Appointment.find(params[:id])
    end
  end

  def new 
    @appointment = Appointment.new 
  end 

  def create 
    @appointment = current_client.appointments.build(appointment_params)
    if @appointment.save 
      redirect_to @appointment
    else 
      render :new 
    end 
  end 

  def edit
    if params[:client_id]
      client = Client.find_by(id:params[:client_id])
    if client
      @appointment = client.appointments.find_by(id:params[:id])
      redirect_to client_appointments_path(client) if !@appointment
    else
      redirect_to clients_path, alert: "Client not found"
    end
    else
      @appointment = Appointment.find(params[:id])
    end
  end

  def update 
    @appointment = Appointment.find(params[:id])
    @appointment.update(appointment_params)
    if @appointment.save
      redirect_to @appointment
    else
      render :edit
    end
  end 
  
  def destroy 
    @appointment = Appointment.find_by_id(params[:id])
    if is_logged_in? 
      @appointment = current_client.appointments.find_by_id(params[:id])
    if @appointment
      @appointment.destroy
      flash[:message] = "Your appointment was deleted."
      redirect_to client_appointments_path(current_client)  
    else
      flash[:message] = "Unable to delete this appointment since it doesn't belong to you."
      redirect_to "/"
    end
    else
      flash[:message] = "You need to be logged in first to access this page."
      redirect_to "/login"
    end
  end
    
  private 

  def appointment_params
    params.require('appointment').permit(:special_request, :desired_time, :desired_date, :client_id, :treatment_id)
  end

  # def find_appointment_client
  #   if params[:client_id]
  #     client = Client.find_by(id:params[:client_id]) && current_client == client
  #   end 
  # end 
end
