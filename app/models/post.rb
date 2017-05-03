class Post < ApplicationRecord
  after_create :take_image

  belongs_to :user

  validates :user_id, presence: true
  validates :markdown, presence: true, length: { maximum: 4096 }
  validates :tweet, length: { maximum: 80 }

  private

  def take_image
    file = Tempfile.new(["template_#{self.id.to_s}", '.png'], 'tmp', :encoding => 'ascii-8bit')
    kit = IMGKit.new(self.html, quality: 50)
    kit.stylesheets << Rails.root.join('public', 'github-markdown.css')
    file.write(kit.to_png)
    file.flush
    result = self.user.twitter_client.update_with_media("#{self.tweet} \n #tweet_markdown https://tweet-markdown.herokuapp.com/", File.new(Rails.root.join(file.path).to_s))
    self.tweet_url = result.url.to_s
    self.tweet_image_url = result.media.first&.media_url_https.to_s
    self.save
    file.unlink
  end
end
