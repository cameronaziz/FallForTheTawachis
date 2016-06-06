class Mailer < ApplicationMailer
  def reservation_confirmation(reservation)
    @reservation = reservation
    mail(to: reservation.email,
         from: 'mail@fallforthetawachis.com',
         subject: 'Thank you for registering',
         template_path: 'mailer',
         template_name: 'reservation_confirmation')
  end


  def reservation_creation(reservation)
    @reservation = reservation

    mail(to: reservation.email,
         from: 'mail@fallforthetawachis.com',
         subject: 'Please RSVP',
         template_path: 'mailer',
         template_name: 'reservation_creation')
  end
end
