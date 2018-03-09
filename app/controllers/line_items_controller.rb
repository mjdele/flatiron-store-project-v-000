class LineItemsController < ApplicationController

  def create
    current_user.new_cart
    line_item_add = current_user.current_cart.add_item(params[:item_id].to_i)
    line_item_add.save
    redirect_to cart_path(current_user.current_cart)
  end

end
