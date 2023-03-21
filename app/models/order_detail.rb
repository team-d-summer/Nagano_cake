class OrderDetail < ApplicationRecord
  belongs_to :item
  belongs_to :order

  enum making_status: {tyakusyuhuka: 0, tyakusyumati: 1, seisakutyuu: 2, seisakukanryou: 3 }
end
