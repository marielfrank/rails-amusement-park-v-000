class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user && @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:alert] = user.errors.full_messages.join(", ")
            render 'users/new'
        end
    end

    def show
        redirect_to root_path unless session[:user_id]
        @user = User.find_by(id: params[:id])
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :height, :happiness, :nausea, :tickets, :admin)
    end
end