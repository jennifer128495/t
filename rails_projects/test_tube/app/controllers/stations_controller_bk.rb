class StationsController < ApplicationController
  before_action :set_station, only: [:show, :edit, :update, :destroy]

  # GET /stations
  # GET /stations.json
  def index
    @stations = Station.all

    #response = HTTParty.get('http://0.0.0.0:3000/convertcsv.json')
    # r = HTTParty.get('http://0.0.0.0:3000/convertcsv.json')
    # r = HTTParty.get('http://rubygems.org/api/v1/versions/httparty.json')
    # r = HTTParty.get('http://0.0.0.0:3000/convertcsv.json') 

  linestation_list = JSON.parse(File.read('app/assets/javascripts/convertcsv.json'))
  # puts "first record"
  # puts linestation_list[0]["From Station"]
  $i = 0
  $stops = 5
  
  origin_stations = ["East Ham"]


  final_to_station_array =[]
  processed_stations = []


  while $i < $stops  do
    puts("*******Stations from East Ham with the following stops (1+) #$i **********" )
    to_station = ""

      final_to_station_array = []
      statition_detail = {}



      # origin_stations.each do | origin_station |
        # origin_station = origin_stations[0]


        linestation_list.each do | ls |


          # puts ls["To Station"] == old_origin_station
          # if final_to_station_array.include?(ls["From Station"])
          #   puts "include the From Station in the final"
          # end
          from_tube_lines = []
          

          if origin_stations.include?(ls["From Station"]) ||  origin_stations.include?(ls["To Station"])
                          
            from_tube_lines.push(ls["Tube Line"])


            origin_tube_line = "District"
            updated_tube_lines =""

            origin_stations.each do | origin_station |

              # updated_tube_lines = updated_tube_lines.present?? updated_tube_lines : origin_tube_line
              puts "initialiezed updated_tube_lines"
              puts updated_tube_lines

              unless processed_stations.include?(origin_station) 
                puts "*****adding to the processed_station now"
                processed_stations.push(origin_station)
                puts "origin_station"
                puts origin_station
                puts "*****processed_stations"
                puts processed_stations
              end  

              unless processed_stations.include?(ls["To Station"]) 
                unless final_to_station_array.include?(ls["To Station"])
                  puts "***adding to the final stations now"
                  puts ls["To Station"]
                  final_to_station_array.push(ls["To Station"])
                  statition_detail[ls["To Station"]] = "#{ls['To Station']} (lines = #{ls['Tube Line']})"
                end
              end

              unless processed_stations.include?(ls["From Station"])
                unless final_to_station_array.include?(ls["From Station"])
                  puts "***adding to the final stations now"
                  puts ls["From Station"]
                  final_to_station_array.push(ls["From Station"])
                  statition_detail[ls["From Station"]] = "#{ls['From Station']} (lines = #{ls['Tube Line']})"
                end
              end

              puts " old updated_tube_lines ???"
              puts updated_tube_lines

              puts " old origin_tube_line  ???"
              puts origin_tube_line 

              if origin_tube_line == ls["Tube Line"]
                updated_tube_lines = origin_tube_line 
                puts "original is the same as the current, assign to the updated one"
              else

                puts "----- the updated_tube_lines"
                puts updated_tube_lines              
                updated_tube_lines = origin_tube_line + ", " + ls["Tube Line"]
                puts " **** new updated_tube_line"
                puts updated_tube_lines

              end

 
            
            end  

               origin_tube_line = updated_tube_lines
              puts " **** new updated_tube_line"
              puts updated_tube_lines
                       puts "-----from_tube_lines----"
                puts from_tube_lines


          end
        end


      # end
      

      origin_stations = []
      origin_stations = final_to_station_array
    $i +=1

    puts "&&&&&&& the needed information &&&&&&"              
    puts "*******final_to_station_array"
    puts final_to_station_array
    puts final_to_station_array.size
    puts "** station detail"
    puts statition_detail
    puts "-----"
  end


  # origin_station = "East Ham"
  # to_station = ""
  #   linestation_list.each do | ls |
  #     while $i < $stops  do
  #         puts("Inside the loop i = #$i" )
  #         puts ls["From Station"]
  #         if ls["From Station"] == origin_station
  #           # to_station = ls["To Station"]
  #           puts ls
  #         end
  #         # origin_station = to_station
  #         # puts "new origin_station"
  #         # puts origin_station
  #         puts "-----"
  #         $i +=1
  #       end

  #   end




  end

  # GET /stations/1
  # GET /stations/1.json
  def show
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
