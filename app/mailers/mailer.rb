class Mailer < ApplicationMailer
  def reservation_email(reservation, email)
    @reservation = reservation
    @email_configurations = EmailConfiguration.where(email_template_id: email)
    #from_email = customer.from_email
    #url = customer.url
    #email = from_email + url
    

    mail(to: reservation.email,
         from: 'mail@fallforthetawachis.com',
         subject: @email_configurations.where(field_id: 1).first.value,
         template_path: 'mailer',
         template_name: email)
  end
end
