class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  enum is_active: { 有効: true, 退会: false }
  def active_for_authentication?
        super && (self.is_active === "有効")
  end
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :cart_items
         has_many :orders
         has_many :addresses

         validates :last_name,  presence: true
         validates :first_name, presence: true
         validates :last_name_kana,  presence: true
         validates :first_name_kana, presence: true
         validates :telephone_number, presence: true
         validates :postal_code,  presence: true
         validates :address, presence: true
end
