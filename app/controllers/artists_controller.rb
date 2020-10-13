class ArtistsController < ApplicationController
    layout 'application'
  
    before_action :set_artist, except: [:new, :create, :index]
    before_action :require_login
  
    def index 
    end
  
  
    def new
      @artist = Artist.new
      @artist.appointments.build(customer: current_customer)
    end
  
    def create
      @artist = Artist.create(artist_params)
      if @artist.save
        redirect_to customer_appointments_path(current_customer)
      else
        render :new
      end
    end
  
    def show
      @artists = Artist.all
    end

    def edit
    end
  
    def update
      if @artist.update(artist_params)
        redirect_to artist_path(@artist)
      else
        render :edit
      end
    end
  
    def destroy
      @artist.destroy
      redirect_to artists_path
    end
  
    private
  
    def set_artist
      @artist = Artist.find_by(id: params[:id])
    end
  
  
    def artist_params
      params.require(:artist).permit(:name, appointments_attributes: [:appointment_time, :id, :customer_id])
    end
  
  end
  