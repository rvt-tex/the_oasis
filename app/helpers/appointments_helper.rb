module AppointmentsHelper

    def display_appointments 
        if @client.appointments.empty?
            content_tag(:h5, link_to('No appointments yet - Book an Appointment here', new_appointment_path))
        else
            client = @client == current_client ? 'You have' : "#{@client.first_name}'s"
            content_tag(:h4, "#{client} #{pluralize(@client.appointments.count, 'booked Appointments')}:")
        end
    end

    def last_updated(appointment)
        appointment.updated_at.strftime("Last updated on %A, %B %d, %Y, at %I:%M %p")
    end

    def display_date(d)
        d.strftime('%A, %B %d, %Y')
    end
    
    def display_time(d)
        d.strftime('%I:%M %p')
    end
end
