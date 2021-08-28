class Item < ApplicationRecord
belongs_to :genre
has_many :cart_items
has_many :order_details
enum is_active: { 販売中: true, 販売停止中: false }

attachment :image
validates :name, presence: true
validates :introduction, presence: true
validates :price, presence: true
end
