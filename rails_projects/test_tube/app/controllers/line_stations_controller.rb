class LineStationsController < ApplicationController
  before_action :set_line_station, only: [:show, :edit, :update, :destroy]

  # GET /line_stations
  # GET /line_stations.json
  def index
    @line_stations = LineStation.all
  end

  # GET /line_stations/1
  # GET /line_stations/1.json
  def show
  end

  # GET /line_stations/new
  def new
    @line_station = LineStation.new
  end

  # GET /line_stations/1/edit
  def edit
  end

  # POST /line_stations
  # POST /line_stations.json
  def create
    @line_station = LineStation.new(line_station_params)

    respond_to do |format|
      if @line_station.save
        format.html { redirect_to @line_station, notice: 'Line station was successfully created.' }
        format.json { render action: 'show', status: :created, location: @line_station }
      else
        format.html { render action: 'new' }
        format.json { render json: @line_station.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /line_stations/1
  # PATCH/PUT /line_stations/1.json
  def update
    respond_to do |format|
      if @line_station.update(line_station_params)
        format.html { redirect_to @line_station, notice: 'Line station was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @line_station.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_stations/1
  # DELETE /line_stations/1.json
  def destroy
    @line_station.destroy
    respond_to do |format|
      format.html { redirect_to line_stations_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_station
      @line_station = LineStation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_station_params
      params.require(:line_station).permit(:line_id, :integer, :station_id, :integer)
    end
end
