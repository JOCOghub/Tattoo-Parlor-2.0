class SessionsController < ApplicationController

    before_action :redirect_if_logged_in, except: [:destroy]
  
    def new
    end
  
    def create
      @customer = Customer.find_by(username: params[:customer][:username])
      if @customer && @customer.authenticate(params[:customer][:password])
        session[:customer_id] = @customer.id
        redirect_to artists_path
      else
        @errors = ["Username or password incorrect"]
        render :new
      end
    end
  
    def destroy
      session.clear
      redirect_to '/'
    end
  
    def create_with_google
      customer = Customer.find_or_create_by(username: auth["email"]) do |c|  
        c.password = SecureRandom.hex
      end
      customer.save
      session[:customer_id] = customer.id
  
      redirect_to appointments_path
    end
  
    private
  
    def auth
      request.env['omniauth.auth']["info"]
    end
  
  end
  