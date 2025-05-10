class LiveRecord < ApplicationRecord
  belongs_to :user
  belongs_to :artist

  validates :location, presence: true, length: { maximum: 100 }
  validates :date, presence: true
  validates :live_title, length: { maximum: 100 }, allow_blank: true
  validates :user_id, presence: true
end
