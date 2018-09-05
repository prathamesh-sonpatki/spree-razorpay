module Spree
  class RazorpayController < StoreController

    skip_before_action :verify_authenticity_token

    def index
      @product = Spree::Product.last
    end

    def create
      payment_method = Spree::PaymentMethod.find(params[:payment_method_id])

      @order = Spree::Order.process_razorpayment(params)
      redirect_to order_path(@order)
    end
  end
end
