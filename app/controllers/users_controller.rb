class UsersController < ApplicationController
    skip_before_action :authorized
    
    def index
        @users = User.all
        render json: @users, status: :accepted
    end

    def create 
        @user = User.create(user_params)
        if @user.valid? && @user.authenticate(user_params[:password])
            @token = encode_token({user_id: @user.id})
            render json: {user: UserSerializer.new(@user), jwt: @token}, status: :accepted
        else
            render json: {message: "Username Taken"}, status: :not_acceptable
        end
    end

   
    private

    def user_params
        params.require(:user).permit(:username, :password)
    end

end
