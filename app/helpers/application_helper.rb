module ApplicationHelper

  def pretty_date_time(dt, tz = "Pacific Time (US & Canada)", format = "%d-%b-%Y %H:%M")
    dt.in_time_zone(tz).strftime(format) if dt
  end

  def pretty_date(dt, format = "%d-%b-%Y")
    dt.strftime(format) if dt
  end

  def iconify(obj_type)
  	icons = {:Picture => 'icon-camera-retro', :Note => 'icon-pencil'}
  	content_tag(:i, nil, :class=>icons[obj_type.name.to_sym])
    #return "<i class='icon-camera-retro'></i>".html_safe
  end

end
