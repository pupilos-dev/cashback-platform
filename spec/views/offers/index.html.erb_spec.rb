require 'rails_helper'

RSpec.describe "offers/index", type: :view do
  before(:each) do
    assign(:offers, [
      Offer.create!(
        advertiser_name: "Advertiser Name",
        url: "Url",
        description: "MyText",
        premium: false
      ),
      Offer.create!(
        advertiser_name: "Advertiser Name",
        url: "Url",
        description: "MyText",
        premium: false
      )
    ])
  end

  it "renders a list of offers" do
    render
    assert_select "tr>td", text: "Advertiser Name".to_s, count: 2
    assert_select "tr>td", text: "Url".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
  end
end
