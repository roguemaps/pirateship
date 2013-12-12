module ApplicationHelper

  def title(page_title)
    content_for(:page_title) { ['Rogue Maps', page_title].join(' - ') }
  end

  def body_classes
    controller.controller_path.split('/')
  end

  def add_body_classes(classes)
    content_for(:body_classes) { body_classes.append(classes).flatten }
  end

  def body_id
    controller.controller_path.split('/').append(controller.action_name).join('-')
  end



end
