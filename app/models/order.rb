class Order < ApplicationRecord
  # belongs_to :customer#, optional: true    # A mettre après pour avoir le nom + mail
  belongs_to :relai
  # has_many :compositions, through: :OrderCompositions
  # has_many :compositions
  belongs_to :composition
  belongs_to :size

  # validates :customer_id, presence: true
  validates :relai_id, presence: true
  validates :composition_id, presence: true
  validates :size_id, presence: true
end
