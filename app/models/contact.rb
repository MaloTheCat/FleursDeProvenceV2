class Contact < ApplicationRecord
  has_many :orders

  validates :email, presence: true
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :phone, presence: true

end
