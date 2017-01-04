class LineStation2sController < ApplicationController
  before_action :set_line_station_2, only: [:show, :edit, :update, :destroy]

  # GET /line_station_2s
  # GET /line_station_2s.json
  def index
    @line_station_2s = LineStation2.all
  end

  # GET /line_station_2s/1
  # GET /line_station_2s/1.json
  def show
  end

  # GET /line_station_2s/new
  def new
    @line_station_2 = LineStation2.new
  end

  # GET /line_station_2s/1/edit
  def edit
  end

  # POST /line_station_2s
  # POST /line_station_2s.json
  def create
    @line_station_2 = LineStation2.new(line_station_2_params)

    respond_to do |format|
      if @line_station_2.save
        format.html { redirect_to @line_station_2, notice: 'Line station 2 was successfully created.' }
        format.json { render action: 'show', status: :created, location: @line_station_2 }
      else
        format.html { render action: 'new' }
        format.json { render json: @line_station_2.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /line_station_2s/1
  # PATCH/PUT /line_station_2s/1.json
  def update
    respond_to do |format|
      if @line_station_2.update(line_station_2_params)
        format.html { redirect_to @line_station_2, notice: 'Line station 2 was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @line_station_2.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_station_2s/1
  # DELETE /line_station_2s/1.json
  def destroy
    @line_station_2.destroy
    respond_to do |format|
      format.html { redirect_to line_station_2s_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_station_2
      @line_station_2 = LineStation2.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_station_2_params
      params.require(:line_station_2).permit(:line_id, :station_id)
    end
end
