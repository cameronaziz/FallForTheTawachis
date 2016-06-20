class Mailer < ApplicationMailer
  def reservation_email(reservation, email, customer)
    @reservation = reservation
    @email_configurations = EmailConfiguration.where(email_template_id: email)
    mail(to: reservation.email,
         #from: "#{customer.from_email}@#{customer.url}",
         from: 'mail@fallforthetawachis.com',
         subject: @email_configurations.where(field_id: 1).first.value,
         template_path: 'mailer',
         template_name: email)
  end
end
