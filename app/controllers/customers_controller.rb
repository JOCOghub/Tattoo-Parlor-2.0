class CustomersController < ApplicationController

    before_action :redirect_if_logged_in
  
    layout 'application'
  
    def new
        @customer = Customer.new
    end
  
    def create
      @customer = Customer.new(customer_params)
      if @customer.save
        session[:customer_id] = @customer.id
        redirect_to customer_appointments_path(current_customer)
        # redirect_to customer_path(@customer)
      else
        # @errors = @customer.errors.full_messages
        render :new
      end
    end
  
    private
  
    def customer_params
      params.require(:customer).permit(:username, :password, :password_confirmation)
    end
  
  end