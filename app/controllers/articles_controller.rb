class ArticlesController < ApplicationController
  before_action :load_articles, only: %i[index show like]
  before_action :load_article_likes, only: %i[index show]

  def index
    capture_article_likes
  end

  def show
    @article = @articles.find { |article| article['id'] == number_or_nil(params[:id]) }
  end

  private

  def load_articles
    url = 'https://s3-eu-west-1.amazonaws.com/olio-staging-images/developer/test-articles-v4.json'
    response = RestClient.get url, { accept: :json }
    @articles = JSON.parse(response)
  end

  def load_article_likes
    @local_articles = Article.all
  end

  def capture_article_likes
    article_hash = {}
    @articles.each do |article|
      article_hash[:article_unique_id] = number_or_nil(article['id'])
      #article_hash[:like_count] = number_or_nil(article['reactions']['likes'])
      Article.create(article_hash)
    end
  end

  def number_or_nil(string)
    Integer(string || '')
  rescue ArgumentError
    nil
  end
end
