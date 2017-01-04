class LineStationNewsController < ApplicationController
  # require 'net/http'
  before_action :set_line_station_news, only: [:show, :edit, :update, :destroy]

  # GET /line_station_news
  # GET /line_station_news.json
  def index
    @line_station_news = LineStationNew.all

    # source = "http://0.0.0.0:3000/convertcsv.json"
    # resp = Net::HTTP.get_response(URI.parse(source))
    # data = resp.body
    # results = JSON.parse(data)
  end

  # GET /line_station_news/1
  # GET /line_station_news/1.json
  def show
  end

  # GET /line_station_news/new
  def new
    @line_station_news = LineStationNew.new
  end

  # GET /line_station_news/1/edit
  def edit
  end

  # POST /line_station_news
  # POST /line_station_news.json
  def create
    @line_station_news = LineStationNew.new(line_station_news_params)

    respond_to do |format|
      if @line_station_news.save
        format.html { redirect_to @line_station_news, notice: 'Line station new was successfully created.' }
        format.json { render action: 'show', status: :created, location: @line_station_news }
      else
        format.html { render action: 'new' }
        format.json { render json: @line_station_news.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /line_station_news/1
  # PATCH/PUT /line_station_news/1.json
  def update
    respond_to do |format|
      if @line_station_news.update(line_station_news_params)
        format.html { redirect_to @line_station_news, notice: 'Line station new was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @line_station_news.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_station_news/1
  # DELETE /line_station_news/1.json
  def destroy
    @line_station_news.destroy
    respond_to do |format|
      format.html { redirect_to line_station_news_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_station_news
      @line_station_news = LineStationNew.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_station_news_params
      params.require(:line_station_news).permit(:line_id, :station_id)
    end
end
