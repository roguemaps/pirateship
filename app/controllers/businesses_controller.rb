class BusinessesController < ApplicationController

  def search

    # @businesses = Business.active.by_city(City.search('ashland oregon')).search('food')
    @businesses = Business.active.by_city(City.search(search_params[:location])).search(search_params[:q])
    @location = search_params[:location]
    @q = search_params[:q]
  end


  private

    def search_params
      params.permit(:location, :q)
    end
end

