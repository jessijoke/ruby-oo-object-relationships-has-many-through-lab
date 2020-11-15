class Patient
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        save
    end

    def save
        @@all << self
    end

    def self.all 
        @@all
    end

    def appointments
        Appointment.all.select { |a| a.patient == self }
    end

    def new_appointment (date, doctor)
        Appointment.new(date, self, doctor)
    end

    def doctors
        appointments.map { |a| a.doctor }
    end
end