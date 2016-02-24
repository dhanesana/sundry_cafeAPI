class CavesController < ApplicationController
  before_action :set_cafe, only: [:show, :update, :destroy]

  # GET /caves
  # GET /caves.json
  def index
    @caves = Cafe.all

    render json: @caves
  end

  # GET /caves/1
  # GET /caves/1.json
  def show
    render json: @cafe
  end

  # POST /caves
  # POST /caves.json
  def create
    @cafe = Cafe.new(cafe_params)

    if @cafe.save
      render json: @cafe, status: :created, location: @cafe
    else
      render json: @cafe.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /caves/1
  # PATCH/PUT /caves/1.json
  def update
    @cafe = Cafe.find(params[:id])

    if @cafe.update(cafe_params)
      head :no_content
    else
      render json: @cafe.errors, status: :unprocessable_entity
    end
  end

  # DELETE /caves/1
  # DELETE /caves/1.json
  def destroy
    @cafe.destroy

    head :no_content
  end

  private

    def set_cafe
      @cafe = Cafe.find(params[:id])
    end

    def cafe_params
      params.require(:cafe).permit(:kor_name, :eng_name, :url, :cafe_type)
    end
end
