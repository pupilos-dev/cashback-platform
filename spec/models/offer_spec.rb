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
end
