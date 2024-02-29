class SessionsController < ApplicationController
    skip_before_action :authenticate_user!, only: %i[login create]
    skip_before_action :user_has_profile?
    def login
    end

    def create
        #debugger
        @user = User.find_by(email: params[:session][:email])

        if @user.present? && @user.authenticate(params[:session][:password])
            if @user.is_confirmed?
                session[:user_id] = @user.id
                redirect_to root_path, notice: "Bienvenido"
            else
                redirect_to login_path, notice: "You have confirm your account."
            end
        else
            redirect_to login_path, notice: "Contraseña incorrecta"
            end
    end
    
    def destroy
        session[:user_id] = nil
        redirect_to login_path, notice: "Cerro Sesion."
    end

end
