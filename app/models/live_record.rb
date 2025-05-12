class LiveRecord < ApplicationRecord
  belongs_to :user
  belongs_to :artist
  has_many :setlists, dependent: :destroy
  has_many :songs, through: :setlists

  validates :location, presence: true, length: { maximum: 100 }
  validates :date, presence: true
  validates :live_title, length: { maximum: 100 }, allow_blank: true
  validates :user_id, presence: true
end
