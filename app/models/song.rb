class Song < ApplicationRecord
  has_many :setlists, dependent: :destroy
  has_many :live_records, through: :setlists

  validates :track_number, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :title, presence: true, length: { maximum: 100 }
end
