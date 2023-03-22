class Item < ApplicationRecord
  
  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  has_many :order_details
  
  scope :search_genre, ->(genre) {where(genre_id: genre)}
  
  validates :name, presence: true, uniqueness: true
  validates :introduction, presence: true
  validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  validates :is_active, inclusion: [true, false]
  
  has_one_attached :image
  
def get_image
    (image.attached?) ? image : 'no_image.jpg'
end

  def add_tax_price
    (price*1.1).floor
  end
  
end
