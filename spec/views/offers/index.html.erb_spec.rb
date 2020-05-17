require 'rails_helper'

RSpec.describe "offers/index", type: :view do
  before(:each) do
    assign(:offers, [
      Offer.create!(
        advertiser_name: "Renata",
        url: "https://www.lemoney.com/",
        description: "Description",
        premium: false,
        starts_at: Date.current,
        member_id: FactoryBot.create(:member).id
      )
    ])
  end

  it "renders a list of offers" do
    render
    assert_select "tr>td", text: "Renata".to_s, count: 1
    assert_select "tr>td", text: "https://www.lemoney.com/".to_s, count: 1
    assert_select "tr>td", text: "Description".to_s, count: 1
    assert_select "tr>td", text: false.to_s, count: 1
  end
end
