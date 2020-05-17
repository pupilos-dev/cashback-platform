require 'rails_helper'

RSpec.describe Member, type: :model do
  it { is_expected.to have_many(:offers) }
end
