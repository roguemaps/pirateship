class PagesController < ApplicationController

  def landing
    puts "==================landing================================" 
    set_show_params 
    search = Business.active.by_city(City.search(@location)).tagged_with_all(@filter_tags)
    @businesses = search.paginate(:page => @page, per_page: 10)
  end
  
  def about
  end
  
  def set_show_params
    show_params = params.permit(:location, :filter_tags, :page)

    @page = params[:page]
    @location = show_params[:location]

    @filter_tags = if show_params[:filter_tags].blank?
      []
    else
      tag_list = show_params[:filter_tags].split(",").map &:strip
      Tag.find_all_by_name(tag_list)
    end
  end
  
end
