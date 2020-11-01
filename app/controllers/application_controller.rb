class ApplicationController < ActionController::Base
    before_action :set_current_user
    before_action :set_all_user
    before_action :set_all_post
    before_action :access_authority
    before_action :form_check, only: [:logform]
    before_action :set_modal_form
    
    def set_current_user
        @current_user = User.find_by(id: session[:user_id])
    end

    def set_modal_form
        @post = Post.new
    end
    
    def set_all_user
        @users = User.all
    end

    def set_all_post
        @posts = Post.all
    end

    def access_authority
        if session[:user_id] == nil
            flash[:notice] = "ログインしてください"
            redirect_to("/")
        end
    end

    def form_check
        # binding.pry

        if params[:email].blank? && params[:password].blank?
            @email_null = "emailを入力してください"
            @password_null = "passwordを入力してください"
        else
            if params[:email].blank?
                @email_null = "emailを入力してください"
            end
                
            if params[:password].blank?
                @password_null = "passwordを入力してください"        
            end
        end

        if @email_null != nil or @password_null != nil 
            render("users/login")
        end
    end
end
