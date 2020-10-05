class Artist < ApplicationRecord

    has_many :appointments
    has_many :customers, through: :appointments
    # validates :name, {presence: {message: "!!!!!!!!!!not blank!!!!!!"}, uniqueness: {message: "must be unique!!!!!"}}
    validates_presence_of :name
  
    validate :is_title_case
  
    before_validation :make_title_case
    accepts_nested_attributes_for :appointments
    # validate :name_presence
    #
    # def appointments_attributes=(attr)
    #   attr.values.each do |m|
    #     new_m = Appointment.new(m)
    #       new_m.artist = self
    #       # new_m.customer = current_customer
    #       new_m.save
    #     # if m[:id] == nil
    #     #   new_m = Appointment.new(m)
    #     #   new_m.artist = self
    #     #   new_m.save
    #     # else
    #     #   new_m = Appointment.find_by(id: m[])
    #     #   new_m.update(m)
    #     # end
    #   end
    # end
  
    private
  
    def is_title_case
      if name != name.titlecase
        errors.add(:name, "must be titlecased")
      end
    end
  
    def make_title_case
      self.name = self.name.titlecase
    end
    # def name_presence
    #   if name == nil || name == "" || name == " "
    #     errors.add(:name, "cannot be empty!!!")
    #   end
    # end
  
  
  end