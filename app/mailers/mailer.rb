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
end