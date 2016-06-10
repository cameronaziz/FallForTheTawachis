class Mailer < ApplicationMailer
  def reservation_email(reservation, email)
    @reservation = reservation
    @email_configurations = EmailConfiguration.where(email_template_id: email)
    mail(to: reservation.email,
         from: 'mail@fallforthetawachis.com',
         subject: @email_configurations.where(field_id: 1).first.value,
         template_path: 'mailer',
         template_name: email)
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
