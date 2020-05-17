 require 'rails_helper'

RSpec.describe "/offers", type: :request do
  let(:valid_attributes) {
    FactoryBot.attributes_for(:offer, member_id: admin.id)
  }

  let(:valid_offer) {
    FactoryBot.create(:offer, member_id: admin.id)
  }

  let(:invalid_attributes) do
    FactoryBot.attributes_for(:offer, url: nil, member_id: admin.id)
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
      let(:offer) { FactoryBot.create(:offer, member_id: admin.id) }
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
        patch offer_url(offer), params: { offer: new_attributes }
        expect(response).to have_http_status(302)
      end
    end

    context "with invalid parameters" do
      let(:offer) { FactoryBot.create(:offer, member_id: admin.id) }
      it "renders a successful response (i.e. to display the 'edit' template)" do
        patch offer_url(offer), params: { offer: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    let!(:offer) { FactoryBot.create(:offer, member_id: admin.id) }

    it "destroys the requested offer" do
      expect {
        delete offer_url(offer)
      }.to change(Offer, :count).by(-1)
    end

    it "redirects to the offers list" do
      delete offer_url(offer)
      expect(response).to redirect_to(offers_url)
    end
  end
end
