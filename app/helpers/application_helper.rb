module ApplicationHelper

  def active_link (link_text, link_path)
    link = link_to link_text, link_path
    if current_page? ==link
      "<li class='active'>#{link}</li>"
    else
      link
    end
  end

  def formatted_time(time)
      format = '%m/%d/%Y %l:%M%p'
      time.strftime(format)
  end


end
