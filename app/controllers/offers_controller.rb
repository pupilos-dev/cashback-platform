class OffersController < ApplicationController
  before_action :set_offer, only: [:edit, :update, :destroy]
  before_action :ensure_admin_user!

  def index
    @offers = Offer.all
  end

  def new
    @offer = Offer.new
  end

  def edit
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.member_id = current_member.id

    respond_to do |format|
      if @offer.save
        format.html { redirect_to({ action: :index }, notice: 'Offer was successfully created.') }
        format.json { render :index, status: :created, location: @offer }
      else
        format.html { render :new }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @offer = Offer.find(params[:id])

    respond_to do |format|
      if @offer.update(offer_params)
        format.html { redirect_to(offers_path, notice: 'Offer was successfully updated.') }
        format.json { render :index, status: :ok, location: @offer }
      else
        format.html { render :edit }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @offer.destroy
    respond_to do |format|
      format.html { redirect_to offers_url, notice: 'Offer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def ensure_admin_user!
    redirect_to root_path if current_member.nil? || !current_member.admin?
  end

  def set_offer
    @offer = Offer.find(params[:id])
  end

  def offer_params
    params.require(:offer).permit(:advertiser_name, :url, :description, :starts_at, :ends_at, :premium, :enabled)
  end
end
