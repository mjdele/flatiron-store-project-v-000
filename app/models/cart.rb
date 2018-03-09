class Cart < ActiveRecord::Base
  has_many :line_items
  has_many :items, :through => :line_items
  belongs_to :user

  def total
    sum = 0
    line_items.each {|a| sum+=(a.quantity*a.item.price)}
    sum
  end

  def add_item(item_id)
    existing_line_item = line_items.detect {|a| a.item_id == item_id}
    if existing_line_item
      quantity = existing_line_item.quantity
      existing_line_item.update(quantity: quantity += 1)
      existing_line_item
    else
      line_items.build(item_id: item_id)
    end
  end

end
