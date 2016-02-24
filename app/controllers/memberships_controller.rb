class MembershipsController < ApplicationController
  before_action :set_membership, only: [:show, :update, :destroy]

  # GET /memberships
  # GET /memberships.json
  def index
    @memberships = Membership.all

    render json: @memberships
  end

  # GET /memberships/1
  # GET /memberships/1.json
  def show
    render json: @membership
  end

  # POST /memberships
  # POST /memberships.json
  def create
    @membership = Membership.new(membership_params)

    if @membership.save
      render json: @membership, status: :created, location: @membership
    else
      render json: @membership.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /memberships/1
  # PATCH/PUT /memberships/1.json
  def update
    @membership = Membership.find(params[:id])

    if @membership.update(membership_params)
      head :no_content
    else
      render json: @membership.errors, status: :unprocessable_entity
    end
  end

  # DELETE /memberships/1
  # DELETE /memberships/1.json
  def destroy
    @membership.destroy

    head :no_content
  end

  private

    def set_membership
      @membership = Membership.find(params[:id])
    end

    def membership_params
      params.require(:membership).permit(:cafe_id, :count)
    end
end
