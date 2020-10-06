module AppointmentsHelper

    def artist_name(appointment)
      appointment.artist.name
    end
  
    def form_url_helper(artist)
      artist ? artist_appointments_path(artist) : appointments_path
    end
  
  end