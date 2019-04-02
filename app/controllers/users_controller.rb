class UsersController < ApplicationController

    def new
        redirect_to user_path(current_user) if user_signed_in?
        @user = User.new
    end

    def create
        @user = User.new(user_params) 
        if @user.save
            flash[:success] = "Usuário cadastrado com sucesso"
            redirect_to root_url
        else
            render 'new'
        end
    end

    def show
    end

    private
        def user_params
            params.require(:user).permit(:email, :name, :password, :password_confirmation)
        end
end
