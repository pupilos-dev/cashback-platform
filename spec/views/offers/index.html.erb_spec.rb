require 'rails_helper'

RSpec.describe "offers/index", type: :view do
  before(:each) do
    assign(:offers, [
      FactoryBot.create(:offer)
    ])
  end

  it "renders a list of offers" do
    render
    assert_select "tr>td", text: "Advertiser", count: 1
    assert_select "tr>td", text: "https://www.lemoney.com/", count: 1
    assert_select "tr>td", text: "Description", count: 1
    assert_select "tr>td", text: false.to_s, count: 1
    assert_select "tr>td", text: Date.current.to_s, count: 2
  end
end
