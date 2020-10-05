class AppointmentsController < ApplicationController
    before_action :require_login
  
    layout 'application'
  
    def index
      if params[:search]
        @appointments = Appointment.appointment_time_search(params[:search])
      else
        @appointments = Appointment.all
      end
    end
  
    def new
      # binding.pry
      if params[:artist_id]
        @artist = Artist.find_by(id: params[:artist_id])
        @appointment = @artist.appointments.build
      else
        @appointment = Appointment.new
        @appointment.build_artist
      end
  
      # @artists = artist.all
      # @artist = @appointment.build_artist
    end
  
    def create
      m = Appointment.new(appointment_params)
      m.customer = current_customer
      m.artist_id = params[:artist_id]
      m.save
      redirect_to artist_path(m.artist)
    end
  
    private
  
    def appointment_params
      params.require(:appointment).permit(:appointment_time, :artist_id, :artist_name, artist_attributes: [:name])
    end
  
  end