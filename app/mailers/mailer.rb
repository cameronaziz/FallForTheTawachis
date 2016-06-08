class Mailer < ApplicationMailer
  def reservation_confirmation(reservation, email)
    @reservation = reservation
    @configurations = EmailConfiguration.where(customer_id: reservation.customer_id, email_template_id: email)
    #file = File.join(Rails.root, 'app', 'assets', 'images', 'emails', '1', 'PROMO-GREEN2_01_01.jpg')
    #attachments.inline['PROMO-GREEN2_01_01.jpg'] = File.read(file)
    mail(to: reservation.email,
         from: 'mail@fallforthetawachis.com',
         subject: @configurations.where(field_id: 1).first.value,
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
