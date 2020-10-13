module AppointmentsHelper

    def artist_name(appointment)
      appointment.artist.name
    end
  
    def appointment
       @appointment
    end  
  
  end