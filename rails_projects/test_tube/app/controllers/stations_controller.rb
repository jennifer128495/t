class StationsController < ApplicationController
  before_action :set_station, only: [:show, :edit, :update, :destroy]

  # GET /stations
  # GET /stations.json
  def index
    @stations = Station.all
    
    # get all the line and station list
    line_station_list = JSON.parse(File.read('app/assets/javascripts/convertcsv.json'))

    # minimum stops
    @stops = params[:stops].to_i
    
    # default station
    origin_stations = ["East Ham"]

    # list of processed stations
    processed_stations = []

    # results for the station and line info
    @statition_detail ={}

    i = 0
    while i < @stops  do
      # list of final stations and detail information
      final_to_station_array = []
      statition_detail = {}
      origin_stations.each do | origin_station |
        line_station_list.each do | ls |
          if origin_station == ls["From Station"] ||  origin_station == ls["To Station"]                          
            origin_tube_line = "District"
            updated_tube_lines =""

            unless processed_stations.include?(origin_station) 
              processed_stations.push(origin_station)
            end  
            
            unless processed_stations.include?(ls["To Station"]) 
              unless final_to_station_array.include?(ls["To Station"])
                # puts ls["To Station"]
                if origin_tube_line == ls['Tube Line']
                  updated_tube_lines = ls['Tube Line']
                else
                  updated_tube_lines = origin_tube_line + ", " + ls['Tube Line']
                end
                final_to_station_array.push(ls["To Station"])
                statition_detail[ls["To Station"]] = "#{ls['To Station']} (lines = #{updated_tube_lines})"
              end
            end

            unless processed_stations.include?(ls["From Station"])
              unless final_to_station_array.include?(ls["From Station"])
                # puts ls["From Station"]
                if origin_tube_line == ls['Tube Line']
                  updated_tube_lines = ls['Tube Line']
                else
                  updated_tube_lines = origin_tube_line + ", " + ls['Tube Line']
                end
                final_to_station_array.push(ls["From Station"])
                statition_detail[ls["From Station"]] = "#{ls['From Station']} (lines = #{updated_tube_lines})"
              end
            end

          end
        end
      end
      i +=1

      origin_stations = final_to_station_array
      @statition_detail = Hash[statition_detail.sort]
    end
      # puts "______________"
      # @statition_detail.each do |key, array|
      #   puts array
      # end
      # puts "______________"


  end

  # GET /stations/1
  # GET /stations/1.json
  def show
    # get all the line and station list
    line_station_list = JSON.parse(File.read('app/assets/javascripts/convertcsv.json'))

    # minimum stops
    # @stops = params[:stops].to_i
    # @stops = params[:id].to_i
    puts "JYZ params"
    puts params[:stations][:stops]
    @stops = params[:stations][:stops].to_i
    # default station
    origin_stations = ["East Ham"]

    # list of processed stations
    processed_stations = []

    # results for the station and line info
    @statition_detail ={}

    i = 0
    while i < @stops  do
      # list of final stations and detail information
      final_to_station_array = []
      statition_detail = {}
      origin_stations.each do | origin_station |
        line_station_list.each do | ls |
          if origin_station == ls["From Station"] ||  origin_station == ls["To Station"]                          
            origin_tube_line = "District"
            updated_tube_lines =""

            unless processed_stations.include?(origin_station) 
              processed_stations.push(origin_station)
            end  
            
            unless processed_stations.include?(ls["To Station"]) 
              unless final_to_station_array.include?(ls["To Station"])
                # puts ls["To Station"]
                if origin_tube_line == ls['Tube Line']
                  updated_tube_lines = ls['Tube Line']
                else
                  updated_tube_lines = origin_tube_line + ", " + ls['Tube Line']
                end
                final_to_station_array.push(ls["To Station"])
                statition_detail[ls["To Station"]] = "#{ls['To Station']} (lines = #{updated_tube_lines})"
              end
            end

            unless processed_stations.include?(ls["From Station"])
              unless final_to_station_array.include?(ls["From Station"])
                # puts ls["From Station"]
                if origin_tube_line == ls['Tube Line']
                  updated_tube_lines = ls['Tube Line']
                else
                  updated_tube_lines = origin_tube_line + ", " + ls['Tube Line']
                end
                final_to_station_array.push(ls["From Station"])
                statition_detail[ls["From Station"]] = "#{ls['From Station']} (lines = #{updated_tube_lines})"
              end
            end

          end
        end
      end
      i +=1

      origin_stations = final_to_station_array
      @statition_detail = Hash[statition_detail.sort]
    end
      # puts "______________"
      # @statition_detail.each do |key, array|
      #   puts array
      # end
      # puts "______________"

  end

  # GET /stations/new
  def new
    @station = Station.new
  end

  # GET /stations/1/edit
  def edit
  end

  # POST /stations
  # POST /stations.json
  def create
    @station = Station.new(station_params)

    respond_to do |format|
      if @station.save
        format.html { redirect_to @station, notice: 'Station was successfully created.' }
        format.json { render action: 'show', status: :created, location: @station }
      else
        format.html { render action: 'new' }
        format.json { render json: @station.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stations/1
  # PATCH/PUT /stations/1.json
  def update
    respond_to do |format|
      if @station.update(station_params)
        format.html { redirect_to @station, notice: 'Station was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @station.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stations/1
  # DELETE /stations/1.json
  def destroy
    @station.destroy
    respond_to do |format|
      format.html { redirect_to stations_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_station
      @station = Station.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def station_params
      params.require(:station).permit(:name)
    end
end
