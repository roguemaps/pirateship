class BusinessesController < ApplicationController

  def search
    set_search_params

    # @businesses = Business.active.by_city(City.search('ashland oregon')).search('food')
    @businesses = Business.active.by_city(City.search(@location)).tagged(@filter_tags).search(@q).delete_if{|b| !b.tagged?(@filter_tags)}
  
  end

  def show
    @business = Business.find(params[:id])
  end

  private

    def set_search_params
      search_params = params.permit(:location, :q, :filter_tags)

      @location = search_params[:location]
      @q = search_params[:q]

      @filter_tags = if search_params[:filter_tags].blank?
        []
      else
        tag_list = search_params[:filter_tags].split(",").map &:strip
        Tag.find_all_by_name(tag_list)
      end
    end
end

