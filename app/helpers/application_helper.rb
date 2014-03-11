module ApplicationHelper

  def nav_link_to(name = nil, route = nil, options = {class: ""}, &block)
    options[:class] += " active" if current_page?(route)
    link_to(name, route, options, &block)
  end

end
