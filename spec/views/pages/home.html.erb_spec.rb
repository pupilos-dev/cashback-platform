require 'rails_helper'

RSpec.describe "pages/home.html.erb", type: :view do
  context 'when member is not logged in' do
    before(:each) do
      assign(:offers, [
        FactoryBot.create(:offer)
      ])
    end

    it "renders a simple offer" do
      render

      assert_select "div>a>h1", text: "Cashback Platform", count: 1
      assert_select "div>button>a", text: "Sign up", count: 1
      assert_select "div>button>a", text: "Sign in", count: 1
      assert_select "div>p", text: "Advertiser", count: 1
      assert_select "div>p", text: "Description", count: 1
      assert_select "div>button", text: "Shop Now", count: 1
    end
  end

  context 'when offer is premium' do
    before(:each) do
      assign(:offers, [
        FactoryBot.create(:offer_premium)
      ])
    end

    it "renders a premium offer" do
      render

      assert_select "div>p", text: "Premium", count: 1
      assert_select "div>button", text: "Shop Now", count: 1
    end
  end

  context "when exist premium offers and regular offers" do
    before(:each) do
      assign(:offers, [
        FactoryBot.create(:offer),
        FactoryBot.create(:offer_premium)
      ])
    end

    it "check if there is just one premium offer" do
      render

      assert_select "div>p", text: "Premium", count: 1
      assert_select "div>button", text: "Shop Now", count: 2
    end
  end

  context 'when member is logged in' do
    let(:member) { FactoryBot.create(:member) }

    before(:each) do
      sign_in member

      assign(:offers, [
        FactoryBot.create(:offer)
      ])
    end

    it "renders a simple offer" do
      render

      assert_select "div>a>h1", text: "Cashback Platform", count: 1
      assert_select "div>button>a", text: "Sign out", count: 1
      assert_select "div>p", text: "Advertiser", count: 1
      assert_select "div>p", text: "Description", count: 1
      assert_select "div>button", text: "Shop Now", count: 1
    end
  end

  context 'when admin is logged in' do
    let(:admin) { FactoryBot.create(:admin) }

    before(:each) do
      sign_in admin

      assign(:offers, [
        FactoryBot.create(:offer)
      ])
    end

    it "renders a simple offer" do
      render

      assert_select "div>a>h1", text: "Cashback Platform", count: 1
      assert_select "div>button>a", text: "Sign out", count: 1
      assert_select "div>button>a", text: "Create Offers", count: 1
      assert_select "div>p", text: "Advertiser", count: 1
      assert_select "div>p", text: "Description", count: 1
      assert_select "div>button", text: "Shop Now", count: 1
    end
  end
end
