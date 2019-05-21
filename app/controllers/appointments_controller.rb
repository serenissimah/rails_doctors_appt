class AppointmentsController < ApplicationController

  before_action :set_doctor
  
  def index
    @appointments = Appointment.all
  end

  def new
    @appointment = @doctor.appointments.new
  end

  def create
    @appointment = @doctor.appointments.new(appointment_params)

    if @appointment.save
      redirect_to doctor_appointments_path(@doctor)
    else
      render :new
    end
  end

  def destroy
    @appointment = @doctor.appointments.find(params[:id])
    @appointment.destroy
    redirect_to doctor_appointments_path(@doctor)
  end


  private

    def appointment_params
      params.permit(:appointment).permit(:user_id, :time, :date)
    end

    def set_doctor
      @doctor = Doctor.find(params[:doctor_id])
    end
end
