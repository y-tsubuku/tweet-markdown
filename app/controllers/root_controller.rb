class RootController < ApplicationController
  protect_from_forgery except: [:parse]

  def parse
    render json: { body: markdown.render(params[:md]).html_safe }
  end

  private

  def markdown
    Redcarpet::Markdown.new(renderer, extensions)
  end

  def renderer
    Redcarpet::Render::HTML.new(options)
  end

  def md_param
    params.require(:md).permit(:body)
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
      tables: true,
    }
  end
end
