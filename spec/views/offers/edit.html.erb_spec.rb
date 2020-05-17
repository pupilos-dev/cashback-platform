require 'rails_helper'

RSpec.describe "offers/edit", type: :view do
  before(:each) do
    @offer = assign(:offer, Offer.create!(
      advertiser_name: FFaker::Name.name,
      url: "https://www.lemoney.com/",
      description: FFaker::Name.name,
      premium: false,
      starts_at: Date.current
    ))
  end

  it "renders the edit offer form" do
    render

    assert_select "form[action=?][method=?]", offer_path(@offer), "post" do
      assert_select "input[name=?]", "offer[advertiser_name]"
      assert_select "input[name=?]", "offer[url]"
      assert_select "textarea[name=?]", "offer[description]"
      assert_select "input[name=?]", "offer[premium]"
    end
  end
end
