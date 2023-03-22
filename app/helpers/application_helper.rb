module ApplicationHelper
  
  # 円priceで表示する
  def to_total_currency(price)
    "#{price.to_i.to_s(:delimited)}円"
  end
  
  def add_items_title
    if @title.present?
      "#{@title}一覧"
    else
      "商品一覧"
    end
  end
  
  def add_submit_text
    path = request.path
    if path.include?("edit")
      "変更内容を保存"
    else
      "新規登録"
    end
  end
  
  def add_submit_cart
    path = request.path
    if path.include?("cart_items")
      "変更"
    else
      "カートに入れる"
    end
  end
end
