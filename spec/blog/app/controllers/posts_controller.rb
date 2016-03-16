class PostsController < Joven::BaseController
  def new
    @post = Post.new
  end

  def create
    post_params = params["post"]
    @post = Post.new
    @post.title = post_params["title"]
    @post.body = post_params["body"]
    @post.created_at = Time.now.to_s

    @post.save
  end

  def index
    @posts = Post.all
  end

  def edit
    post_id = params["id"]
    @post = Post.find(post_id)
  end

  def update
    @post = Post.find(params["id"])
    @post.title = params["post"]["title"]
    @post.body = params["post"]["body"]

    @post.save

    redirect_to :index
  end

  def show
    @post = Post.find(params["id"])
  end

  def delete
    Post.destroy(params["id"])

    redirect_to :index
  end
end
