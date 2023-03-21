class Order < ApplicationRecord
    enum payment_method: { credit_card: 0, transfer: 1 }

    enum status: {
      waiting_for_payment: 0,
      payment_confirmation: 1,
      now_at_work: 2,
      shopping_preparation: 3,
      shopped: 4
    }

  validates :name, presence:true


  has_many :order_details,dependent: :destroy

  belongs_to :customer

  def add_full_address
    "#{self.postal_code} #{self.address} "
  end
end
