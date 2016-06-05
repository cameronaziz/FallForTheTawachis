class Mailer < ApplicationMailer
  def reservation_confirmation(reservation)


    mail(to: reservation.email,
         from: 'mail@fallforthetawachis.com',
         subject: 'Thank you for registering',
         template_path: 'mailer',
         template_name: 'reservation_confirmation'    )
  end
end
