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


  def status(reservation)
    if reservation.not_attending
      'Not Attending'
    else
      if reservation.is_confirmed
        'Confirmed'
      else
        if reservation.email.nil?
          'No Email'
        else
          if reservation.email_sent
            'Sent'
          else
            link_to 'Send Email', controller: :reservations, action: :email, id: reservation
          end
        end
      end
    end
  end

  def reset_email(reservation)
    unless reservation.is_confirmed || reservation.not_attending
      if reservation.email_sent
      link_to 'Reset Email', reset_reservation_email_path(reservation)
      end
    end
  end

  def switch_attending(reservation)
    if reservation.not_attending
      link_to 'Set to Attending', switch_attending_path(reservation)
    else
      link_to 'Set to Not Attending', switch_attending_path(reservation)
    end
  end

  def switch_confirmed(reservation)
    unless reservation.not_attending
      if reservation.is_confirmed
        link_to 'Set to Not Confirmed', switch_confirmed_path(reservation)
      else
        link_to 'Set to Confirm', switch_confirmed_path(reservation)
      end
    end
  end

  def public_link(reservation)
    if reservation.custom_name
      link_to('/res/' + reservation.custom_name, 'http://' + reservation.customer.url + '/res/' + reservation.custom_name)
    else
      link_to('/id/' + reservation.public_id, 'http://' + reservation.customer.url + '/id/' + reservation.public_id)
    end
  end


  def hide_people(reservation)
    "$(function() {
    document.getElementById('person1').style.display = 'none';
    document.getElementById('person2').style.display = 'none';
    document.getElementById('person3').style.display = 'none';
    document.getElementById('person4').style.display = 'none';
    document.getElementById('person5').style.display = 'none';
  });".html_safe
  end
end
