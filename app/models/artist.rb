class Artist < ApplicationRecord
  belongs_to :user
  has_many :live_records

  validates :name, presence: true, length: { maximum: 50 }
end
