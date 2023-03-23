class OrderDetail < ApplicationRecord
  belongs_to :item
  belongs_to :order

  enum making_status: {tyakusyuhuka: 0, tyakusyumati: 1, seisakutyuu: 2, seisakukanryou: 3 }
  def add_total_payment_all
    tax = 1.1
    (self.item.price * tax).floor * self.amount
  end
end
