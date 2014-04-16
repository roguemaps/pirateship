class Admin::TagsController < ApplicationController
  before_filter :authenticate
  before_action :set_tag, only: [:show, :edit, :update, :destroy]
  layout 'admin'

  # GET /admin/tags
  def index
    @tags = Tag.all
  end

  # GET /admin/tags/1
  def show
  end

  # GET /admin/tags/new
  def new
    @tag = Tag.new
  end

  # GET /admin/tags/1/edit
  def edit
  end

  # POST /admin/tags
  def create
    @tag = Tag.new(tag_params)

    if @tag.save
      redirect_to [:admin, @tag], notice: 'Tag was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /admin/tags/1
  def update
    if @tag.update(tag_params)
      redirect_to [:admin, @tag], notice: 'Tag was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /admin/tags/1
  def destroy
    @tag.destroy
    redirect_to admin_tags_url, notice: 'Tag was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag
      @tag = Tag.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def tag_params
      params[:tag].permit(:name, :filterable)
    end
end
