class SessionsController < ApplicationController
    skip_before_action :authorized, only: [:create] 

    def create 
        @user = User.find_by(username: session_params[:username])
        if @user && @user.authenticate(session_params[:password])
            @token = encode_token({user_id: @user.id})
            render json: {user: UserSerializer.new(@user), jwt: @token}, status: :accepted
        end
    end

    def index
        render json: @@user, status: :accepted
    end 

    private

    def session_params
        params.require(:user).permit(:username, :password)
    end

end


=begin 

1. Create User - Sign up
    Validate username ,validates passwordπ
    Bcrypt salts/hashes password
    stored in database

    frontend-> redirect to login 

2. frontend form has username/password 
    sends POST {user: {username: x, password: x}} 
    to route /sessions

    create = create a token. 
    if the user exists, and if the password is valid then you get 
        a token. 
        aka you are signed-in 

3.  frontend recieve  user info/ jwt token
        save to token to local storage
        The user has the token -Its ID- for the remainder of the session
        log out- delete token from local storage 

4. Token permissions
        make restful requests - with token in header
        This is where we auth our jwt token'


=end