class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :carts
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def new_cart
    if current_cart == nil
      carts.create
    end
  end

  def current_cart=(cart)
    if cart == nil
      carts.clear
    else
      carts << cart
    end
  end

  def current_cart
    carts.last
    # carts.detect {|cart| cart.status == "open"}
  end

end
