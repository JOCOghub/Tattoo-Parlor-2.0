class AppointmentsController < ApplicationController
    before_action :require_login
    before_action :set_appointment, except: [:new, :create, :index]
    layout 'application'
  
    def index
      if params[:search]
        @appointments = Appointment.appointment_time_search(params[:search])
        #render show?
      elsif current_customer
        @appointments = current_customer.appointments
        @artists = current_customer.artists
      end  
    end
  
    def new
      if params[:artist_id]
        @artist = Artist.find_by(id: params[:artist_id])
        @appointment = @artist.appointments.build
      else
        @appointment = Appointment.new
        @appointment.build_artist
      end
    end
  
    def create
      a = Appointment.new(appointment_params)
      a.customer = current_customer
      a.artist_id = params[:artist_id]
      a.save
      redirect_to customer_appointments_path(current_customer)
    end
   
   def show 
     @appointments = Appointment.all
   end   

   def edit 
   end   
    
    
   def update
     if @appointment.update(appointment_params)
        redirect_to appointments_path#might need current_customer
     else
        render :edit
     end 
   end  

   def destroy
      @appointment.destroy
      redirect_to appointments_path
   end  
    private
  
    def set_appointment
      @appointment =Appointment.find_by(id: params[:id])
    end  
     
    def appointment_params
      params.require(:appointment).permit(:appointment_time, :artist_id, :artist_name, artist_attributes: [:name])
    end
  
  end