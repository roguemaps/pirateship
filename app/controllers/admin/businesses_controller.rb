class Admin::BusinessesController < ApplicationController
  before_action :set_business, only: [:show, :edit, :update, :destroy]
  layout 'admin'

  # GET /admin/businesses
  def index
    @businesses = Business.all
  end

  # GET /admin/businesses/1
  def show
  end

  # GET /admin/businesses/new
  def new
    if params[:state]
      @state = State.find(params[:state])
      @cities = @state.cities.order(:name)
    end
    @business = Business.new
  end

  # GET /admin/businesses/1/edit
  def edit
    @state = @business.city.state
    @cities = @state.cities.order(:name)
  end

  # POST /admin/businesses
  def create
    @business = Business.new(business_params)

    if @business.save
      redirect_to admin_businesses_path(), notice: 'Business was successfully created.'
    else
      redirect_to new_admin_business_path()
    end
  end

  # PATCH/PUT /admin/businesses/1
  def update
    if @business.update(business_params)
      redirect_to admin_businesses_path(), notice: 'Business was successfully updated.'
    else
      redirect_to new_admin_business_path()
    end
  end

  # DELETE /admin/businesses/1
  def destroy
    @business.destroy
    redirect_to admin_businesses_url, notice: 'Business was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_business
      @business = Business.find(params[:id])
    end

    # def tag_ids=(values)
    #   self.tags << Tag.find(values)
    # end



    # Only allow a trusted parameter "white list" through.
    def business_params
      params[:business].permit(:city_id, :name, :category, {:tag_ids => []}, :new_tags, :formatted_address, :zipcode, :phone, :website, :description, :details, :price_level, :facebook_page, :active, :lat, :lng)
    end
end
