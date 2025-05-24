class Song < ApplicationRecord
  has_many :setlists, dependent: :destroy
  has_many :live_records, through: :setlists

  validates :track_number, numericality: { only_integer: true, greater_than: 0 }, on: :update
  validates :title, length: { maximum: 100 }
end
