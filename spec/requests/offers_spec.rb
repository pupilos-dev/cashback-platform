 require 'rails_helper'

RSpec.describe "/offers", type: :request do
  let(:valid_attributes) {
    FactoryBot.attributes_for(:offer)
  }

  let(:valid_offer) {
    FactoryBot.create(:offer)
  }

  let(:invalid_attributes) do
    {:advertiser_name=>"Idella Gutkowski",
     :url=>"www.lemoney.com/",
     :description=>"Description",
     :starts_at=>"2020-05-16",
     :ends_at=>"2020-05-16",
     :premium=>false}
  end

  let(:admin) { FactoryBot.create(:member) }
  before { sign_in admin }

  describe "GET /index" do
    it "renders a successful response" do
      valid_offer
      get offers_url
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_offer_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      offer = valid_offer
      get edit_offer_url(offer)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Offer" do
        expect {
          post offers_url, params: { offer: valid_attributes }
        }.to change(Offer, :count).by(1)
      end
    end

    context "with invalid parameters" do
      it "does not create a new Offer" do
        expect {
          post offers_url, params: { offer: invalid_attributes }
        }.to change(Offer, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post offers_url, params: { offer: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        {:advertiser_name=>"Idella Gutkowski",
         :url=>"https://www.lemoney.com/",
         :description=>"Description",
         :state=>false,
         :starts_at=> Date.current,
         :ends_at=> Date.current,
         :premium=>true}
      }

      it "return correct http response" do
        offer = Offer.create! valid_attributes
        patch offer_url(offer), params: { offer: new_attributes }
        offer.reload
        expect(response).to have_http_status(302)
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        offer = Offer.create! valid_attributes
        patch offer_url(offer), params: { offer: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested offer" do
      offer = Offer.create! valid_attributes
      expect {
        delete offer_url(offer)
      }.to change(Offer, :count).by(-1)
    end

    it "redirects to the offers list" do
      offer = Offer.create! valid_attributes
      delete offer_url(offer)
      expect(response).to redirect_to(offers_url)
    end
  end
end
