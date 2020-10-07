class AppointmentsController < ApplicationController
    before_action :require_login
  
    layout 'application'
  
    def index
      if params[:search]
        @appointments = Appointment.appointment_time_search(params[:search])
      elsif current_customer
        @appointments = current_customer.appointments
        @artists = current_customer.artists
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
  

   def edit 
     @appointment =Appointment.find_or_create_by(id: params[:appointment_id])
   end   
    
    
   def update
     if @appointment.update(appointment_params)
        redirect_to appointment_path(@appointment)
     else
        #@errors = @appointment.errors.full_messages
        render :edit
     end 
   end  

    private
  
    def appointment_params
      params.require(:appointment).permit(:appointment_time, :artist_id, :artist_name, artist_attributes: [:name])
    end
  
  end