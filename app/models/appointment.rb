class Appointnment < ApplicationRecord
    belongs_to :artist
    belongs_to :customer
  
    accepts_nested_attributes_for :artist
  
    validates_presence_of :appointment_time
  
     scope :appointment_time_search, -> (search) { where("appointment_time >= ?", search) }
  
    # def artist_attributes=(att)
    #
    # end
  
    # def self.appointment_time_search(search)
    #   self.where("appointment_time >= ?", search)
    # end
  
    def artist_name=(name)
      self.artist = Artist.find_or_create_by(name: name)
    end
  
    def artist_name
      self.artist ? self.artist.name : nil
    end
  
  end
  