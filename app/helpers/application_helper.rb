module ApplicationHelper
  def active_class(name)
    controller_name == name ? 'active' : ''
  end
end
