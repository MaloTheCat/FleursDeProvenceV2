class User < ApplicationRecord
  # include Pay::Billable
  has_many :orders
  # pay_customer
  # validates :name, presence: true

end
