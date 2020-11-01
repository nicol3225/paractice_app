class PostsController < ApplicationController

  before_action :correct_user, only: [:edit, :update]
  
  def correct_user
    @post = Post.find_by(id:params[:id])
    if @current_user.id != @post.user_id
      flash[:notice] = "権限がりません"
      redirect_to("/posts/index")
    end
        # binding.pry

  end

  def new
    @post = Post.new
  end


  def index
    @posts = Post.all.order(created_at: :desc)
    @like = Like.new

  end

  def create
    @post = Post.new(post_params)
    @post.user_id = @current_user.id
    @post.postId = 0
        # binding.pry

    if @post.save
      flash[:notice] = "投稿が完了しました"
      redirect_to('/posts/index')
    else
      # binding.pry
      render("posts/new")
    end
  end

  def detail

    @post = Post.find_by(id:params[:id])
    @likes_count_chk = Like.where(user_id:@current_user.id, post_id:@post.id).count
 
    @likes_count = Like.where(post_id:@post.id).count
    @replys = Post.where(postId:params[:id])
    
  end

  def edit
    @post = Post.find_by(id:params[:id])

  end
  
  def update
    # @post = Post.new(id:params[:id])
    @post = Post.find_by(id:params[:id])
    # @post.content = params[:content]
    



    if @post.update(post_params)
      flash[:notice] = "更新が完了しました"
      redirect_to('/posts/index')
    else
      render("posts/edit")
    end

    # binding.pry
  end
  
  def delete
    @post = Post.find_by(id:params[:id])
    @post.destroy
    redirect_to('/posts/index')
  end

  def reply_form
    @reply_id = params[:id]
  end

  def reply
    # @post = Post.new(id:params[:content], image:params[:image])
    @post = Post.new(reply_params)
    @post.user_id = @current_user.id
    @post.postId = params[:id]
    # binding.pry
    
    if @post.save
      flash[:notice] = "リプライが完了しました"
      redirect_to('/posts/index')
    else
      # binding.pry
      render("posts/reply_form")
    end

  end

  def like
    @like = Like.new
    @like.user_id = @current_user.id
    @like.post_id = params[:id]
    where = params[:where]
    # binding.pry

    @like.save
    if params[:where] == "detail"
      redirect_to("/posts/#{params[:id]}")
    elsif params[:where] == "index"
      redirect_to("/posts/#{params[:where]}")
    else
      redirect_to("/users/#{params[:where]}")
    end

  end

  def like_delete

    @like = Like.find_by(user_id:@current_user.id, post_id:params[:id])
    # binding.pry

    @like.destroy
    if params[:where] == "detail"
      redirect_to("/posts/#{params[:id]}")
    elsif params[:where] == "index"
      redirect_to("/posts/index")
    else
      redirect_to("/users/#{params[:where]}")
    end


  end

  def post_params
    params.require(:post).permit(:content,:image)
  end
  def reply_params
    params.require(:post).permit(:content,:image)
  end

  

end
