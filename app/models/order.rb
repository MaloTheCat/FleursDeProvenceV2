class Order < ApplicationRecord
  belongs_to :customer#, optional: true
  belongs_to :relai#, optional: true
  belongs_to :composition#, optional: true

  accepts_nested_attributes_for :customer
  accepts_nested_attributes_for :relai
  accepts_nested_attributes_for :composition



  # validates :customer_id, presence: true
  # validates :relai_id, presence: true
  # validates :composition_id, presence: true

  # has_many :order_compositions
  # has_many :compositions
  # has_many :compositions

  # accepts_nested_attributes_for

end
