class CartsController < ApplicationController

  def show
    # if current_user.current_cart
    #   @current_cart = current_user.current_cart
    # else 
    #   @current_cart = current_user.new_cart
    # end
    # raise params.inspect
    
    @current_cart = current_user.current_cart
  end

  def checkout
    @current_cart = current_user.current_cart
    @current_cart.line_items.each do |line_item|
      current_inventory = line_item.item.inventory
      new_inventory = current_inventory - line_item.quantity
      line_item.item.update(inventory: new_inventory)
    end
 #   @current_cart.line_items.clear
    @current_cart.update(status: "submitted")
    current_user.carts.clear
    redirect_to cart_path(cart_id: params[:id])
  end

end
