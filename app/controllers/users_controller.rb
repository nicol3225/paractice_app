class UsersController < ApplicationController
  before_action :correct_user, only: [:edit, :update]
  skip_before_action :access_authority, only: [:login, :logform, :new, :create]
  def correct_user
    @user = User.find_by(id:params[:id])
    if @current_user.id != @user.id
      flash[:notice] = "権限がありません"
      redirect_to("/users/#{@current_user.id}")
    end
  end

  def mypage
    @user = User.find_by(id:params[:id])
    @mypost = @posts.where(user_id:params[:id])
    @user = User.find_by(id:params[:id])
    @like = Like.new


  end
    
  def new
      @user = User.new
  end

  def login
      @user = User.new
  end

  def logform
 
    @user = User.find_by(email: params[:email],password: params[:password])
    # binding.pry

    if @user 
      session[:user_id] = @user.id
      flash[:notice] = "Logged in"
      redirect_to("/users/#{@user.id}")
    else
      @email = params[:email]
      @password = params[:password]
      @error_message = "パスワードまたはユーザーIDが正しくありません"
        render("users/login")
    end

  end


  def create
      @user = User.new(user_params)

      if @user.save
          session[:user_id] = @user.id
          flash[:notice] = "ユーザー登録が完了しました"
          redirect_to("/users/#{@user.id}")
      else
          render("users/new")
      end
  end



  def logoff
    session[:user_id] = nil
    redirect_to ("/")
  end

  def edit
    @user = User.find_by(id:params[:id])    
  end

  def update
    @user = User.find_by(id:params[:id])
  
    if @user.update(user_params)
      flash[:notice] = "更新が完了しました"
      redirect_to("/users/#{@user.id}")
    else
      render("users/edit")
    end
  end
  
  def user_params
    params.require(:user).permit(:username,:email,:password,:image)
  end

end


