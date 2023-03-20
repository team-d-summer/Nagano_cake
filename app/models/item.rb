class Item < ApplicationRecord
  
  has_one_attached :image
  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  has_many :order_details
  
  validates :name, presence: true, uniqueness: true
  validates :introduction, presence: true
  validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  validates :is_active, inclusion: [true, false]
  
  def get_image(width)
 (image.attached?) ? image : 'no_image.jpg'
  end
  
  def add_tax_price
    (price*1.1).floor
  end
  
end
