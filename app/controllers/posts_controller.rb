class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:create]

  # GET /posts/new
  def new
    @post = Post.new
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.html = render_to_string template: false, partial: 'root/markdown', locals: { markdown: mark.render(@post.markdown) }
    @post.user = current_user

    respond_to do |format|
      if @post.save
        format.html {}
      else
        format.html { render :new }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.require(:post).permit(:markdown, :tweet)
  end

  def your_post?
    current_user.posts.try(:include?, @post)
  end

  def mark
    Redcarpet::Markdown.new(renderer, extensions)
  end

  def renderer
    Redcarpet::Render::HTML.new(options)
  end

  def options
    {
      # no_links: true,
      hard_wrap: true,
      escape_html: true,
      prettify: true
    }

  end

  def extensions
    {
      autolink: true,
      superscript: true,
      disable_indented_code_blocks: true,
      fenced_code_blocks: true,
      tables: true
    }
  end
end
