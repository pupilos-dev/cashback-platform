require 'rails_helper'

RSpec.describe Offer, type: :model do
  subject { FactoryBot.create(:offer) }

  it { is_expected.to validate_presence_of(:advertiser_name) }
  it { is_expected.to validate_uniqueness_of(:advertiser_name).ignoring_case_sensitivity }

  it { is_expected.to validate_presence_of(:url) }

  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_length_of(:description).is_at_most(500).
                with_long_message('500 characters is the maximum allowed')}

  it { is_expected.to validate_presence_of(:starts_at) }

  it { is_expected.to belong_to(:member) }

  context "scope active" do
    it "check active offers" do
      expect(Offer.active).to include(subject)
    end
  end

  context "scope available_offers" do
    let!(:offer) { FactoryBot.create(:offer,
                                     advertiser_name: FFaker::Company.name,
                                     starts_at: Date.current.advance(months: -1),
                                     ends_at: Date.current.advance(months: 1)) }
    let!(:expired_offer) { FactoryBot.create(:offer_expired) }

    it "check available offers" do
      expect(Offer.available_offers).to include(offer)
    end

    it "check unavailable offers" do
      expect(Offer.available_offers).not_to include(expired_offer)
    end
  end

  context "When offer is invalid" do
    let!(:expired_offer) { FactoryBot.create(:offer_expired) }
    let!(:offer_without_advertiser_name) { FactoryBot.build(:offer_without_advertiser_name) }
    let!(:offer_with_invalid_url) { FactoryBot.build(:offer_with_invalid_url) }

    it 'check expired offer' do
      expect(Offer.available_offers).to_not include(:expired_offer)
    end

    it 'check advertiser name' do
      expect(offer_without_advertiser_name.valid?).to be_falsy
    end

    it 'check url' do
      expect(offer_with_invalid_url.valid?).to be_falsy
    end
  end
end
