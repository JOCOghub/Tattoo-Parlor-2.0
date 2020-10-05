class Customer < ApplicationRecord
    has_many :appointments
    has_many :artists, through: :appointments
    validates_presence_of :username
    validates_uniqueness_of :username
    has_secure_password
  end