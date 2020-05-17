class Offer < ApplicationRecord
  require_dependency 'validators/http_url_validator.rb'

  validates :advertiser_name, presence: true
  validates :advertiser_name, uniqueness: true

  validates :url, presence: true
  validates :url, http_url: true

  validates :description, presence: true
  validates :description, length: { maximum: 500,
    too_long: "500 characters is the maximum allowed" }

  validates :starts_at, presence: true

  belongs_to :member, class_name: "Member"

  scope :active, -> { where(enabled: true) }
  scope :available_offers,
    -> { active.where("starts_at <= :date", date: Date.current).where("ends_at >= :date", date: Date.current) }
end
