require 'rails_helper'

RSpec.describe "offers/show", type: :view do
  before(:each) do
    @offer = assign(:offer, Offer.create!(
      advertiser_name: "Advertiser Name",
      url: "Url",
      description: "MyText",
      premium: false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Advertiser Name/)
    expect(rendered).to match(/Url/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/false/)
  end
end
