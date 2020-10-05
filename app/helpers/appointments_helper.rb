module AppointmentsHelper

    def show_artist_name(m, index)
      m.artist.name if index
    end
  
    def form_url_helper(artist)
      artist ? artist_appointments_path(artist) : appointments_path
    end
  
  end