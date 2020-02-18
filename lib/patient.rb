require 'pry'

class Patient
  attr_accessor :name, :appointment, :doctor
  @@all = []
  
  def initialize(name)
    @name = name 
    @@all << self
  end
  
  def self.all 
    @@all
  end
  
  def new_appointment(date, doctor)
    Appointment.new(date, self, doctor)
  end
  
  def appointments
    Appointment.all.select do |appoint|
      appoint.patient.name == self
    end
  end
  
  
  def doctors
    appointments.collect do |appoint|
      appoint.doctor
    end
  end
  
end

