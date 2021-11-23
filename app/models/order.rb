class Order < ApplicationRecord
  # belongs_to :customer#, optional: true    # A mettre après pour avoir le nom + mail
  belongs_to :relai
  belongs_to :composition
  belongs_to :size

  monetize :amount_cents
  # monetize :price_cents

  # validates :customer_id, presence: true
  # validates :relai_id, presence: true
  # validates :composition_id, presence: true
  # validates :size_id, presence: true
end
