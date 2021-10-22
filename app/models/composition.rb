class Composition < ApplicationRecord
  has_one_attached :photo

  belongs_to :florist
  has_many :orders

  validates :name, presence: true
  validates :price, presence: true
  # validates :size, presence: true


end
