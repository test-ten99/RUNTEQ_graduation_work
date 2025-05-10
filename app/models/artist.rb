class Artist < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, uniqueness: true, length: { maximum: 50 }
end
