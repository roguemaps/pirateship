class Admin::StatesController < ApplicationController
  before_action :set_state, only: [:show, :edit, :update, :destroy]

  # GET /admin/states
  def index
    @states = State.all
  end

  # GET /admin/states/1
  def show
  end

  # GET /admin/states/new
  def new
    @state = State.new
  end

  # GET /admin/states/1/edit
  def edit
  end

  # POST /admin/states
  def create
    @state = State.new(state_params)

    if @state.save
      redirect_to admin_states_url, notice: 'State was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /admin/states/1
  def update
    if @state.update(state_params)
      redirect_to admin_states_url, notice: 'State was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /admin/states/1
  def destroy
    @state.destroy
    redirect_to admin_states_url, notice: 'State was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_state
      @state = State.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def state_params
      params[:state].permit(:name, :abbr, :country_id)
    end
end
