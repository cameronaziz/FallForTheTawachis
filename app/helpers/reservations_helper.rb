module ReservationsHelper
  def dynamic_select(parameter)
    if parameter
      parameter_int = parameter.to_i
      options = "<option value='1'>one</option>".html_safe
      if parameter_int > 1
        options << "<option value='2'>two</option>".html_safe
        if parameter_int > 2
          options << "<option value='3'>three</option>".html_safe
          if parameter_int > 3
            options << "<option value='4'>four</option>".html_safe
            if parameter_int > 4
              options << "<option value='5'>five</option>".html_safe
              if parameter_int > 5
                options << "<option value='6'>six</option>".html_safe
              end
            end
          end
        end
      end
    else
      options = "<option value='1'>one</option>".html_safe
    end
    return options
  end


  def email_link(reservation)
    if reservation.email.nil?
      'No Email Provided'
    else
      if reservation.email_sent
        'Sent'
      else
        if reservation.is_confirmed
          'Reservation is confirmed'
        else
          link_to 'Send Email', controller: :reservations, action: :email, id: reservation
        end
      end
    end
  end
end
