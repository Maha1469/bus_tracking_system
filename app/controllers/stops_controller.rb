class StopsController < ApplicationController
  before_action :set_stop, only: [:show, :edit, :update, :destroy]

  # GET /stops
  # GET /stops.json
  def index
    @stops = Stop.all
  end

  # GET /stops/1
  # GET /stops/1.json
  def show
  end

  # GET /stops/new
  def new
    @bus = Bus.find(params[:id])
    @stop = @bus.stops.build
  end

  # GET /stops/1/edit
  def edit
  end

  # POST /stops
  # POST /stops.json
  def create
    @stop = Stop.new(stop_params)
    if @stop.save
      flash[:notice] = "Successfully created new Stop"
      redirect_to buses_path
    else
      render :new
    end
  end

  # PATCH/PUT /stops/1
  # PATCH/PUT /stops/1.json
  def update
    @stop = Stop.find(params[:id])
    @stop.latitude = params[:stop][:latitude]
    @stop.longitude = params[:stop][:longitude]
    if @stop.save
      flash[:notice] = "Successfully updated Stop"
      redirect_to buses_path
    else
      render :edit
    end
  end

  # DELETE /stops/1
  # DELETE /stops/1.json
  def destroy
    @stop.destroy
    respond_to do |format|
      format.html { redirect_to stops_url, notice: 'Stop was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stop
      @stop = Stop.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stop_params
      params.require(:stop).permit(:latitude, :longitude, :bus_id, :stop_number, :name)
    end
end
