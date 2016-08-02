class Mailer < ApplicationMailer
  def reservation_email(reservation, email)
    @reservation = reservation
    @email_configurations = EmailConfiguration.where(email_template_id: email)
    file = File.join(Rails.root, 'app', 'assets', 'images', 'emails', '3', 'image.jpg')
    attachments.inline['image.jpg'] = File.read(file)

    if @reservation.customer.url == 'localhost:3000'
      from_url = 'fallforthetawachis.com'
    else
      from_url = @reservation.customer.url
    end

    mail(to: reservation.email,
         from: "#{reservation.customer.from_email}@#{from_url}",
         #from: 'mail@fallforthetawachis.com',
         subject: @email_configurations.where(field_id: 1).first.value,
         template_path: 'mailer',
         template_name: email)
  end


  def notification_email(reservation)
    @reservation = reservation
    mail(to: 'cameronaziz@gmail.com',
         from: 'support@lucentdigital.com',
         subject: 'New RSVP',
         template_path: 'mailer',
         template_name: 'notification_email'
    )
  end

  def support_email(support_ticket)
    @support_ticket = support_ticket
    mail(to: 'cameron.aziz@lucentdigital.com',
    from: 'support@lucentdigital.com',
    subject: 'New Support Ticket',
    template_path: 'mailer',
    template_name: 'support_email')
  end
end