class PagesController < ApplicationController
  def home
    @offers = Offer.available_offers
  end
end
