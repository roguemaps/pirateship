module ApplicationHelper

  def title(page_title)
    content_for(:page_title) { ['Rogue Maps', page_title].join(' - ') }
  end

end
