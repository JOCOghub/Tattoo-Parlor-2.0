class ApplicationController < ActionController::Base

    helper_method :current_customer
  
    def require_login
      redirect_to '/' if !current_customer
    end
  
    def redirect_if_logged_in
      redirect_to customer_appointments_path if current_customer
    end
  
    def current_customer
      @customer = Customer.find_by(id: session[:customer_id])
    end
  
  end