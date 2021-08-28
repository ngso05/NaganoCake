class Address < ApplicationRecord
  belongs_to :customer
  validates :postal_code, :address, :name, presence: true

  def full_address
    self.postal_code + self.address + self.name
  end
end
