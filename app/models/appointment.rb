class Appointment < ApplicationRecord
  belongs_to :artist
  belongs_to :customer

  accepts_nested_attributes_for :artist

  validates_presence_of :appointment_time

   scope :time_search, -> (search) { where("appointment_time LIKE ?", "%" + search.strip + "%") }

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

end




# def artist_attributes=(att)
  #
  # end

  # def self.quantity_search(search)
  #   self.where("quantity >= ?", search)
  # end