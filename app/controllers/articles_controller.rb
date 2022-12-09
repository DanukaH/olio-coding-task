class ArticlesController < ApplicationController
  before_action :load_articles, only: %i[index show]

  def index; end

  def show
    @article = @articles.find { |article| article['id'] == number_or_nil(params[:id]) }
  end

  private

  def load_articles
    url = 'https://s3-eu-west-1.amazonaws.com/olio-staging-images/developer/test-articles-v4.json'
    response = RestClient.get url, { accept: :json }
    @articles = JSON.parse(response)
  end

  def number_or_nil(string)
    Integer(string || '')
  rescue ArgumentError
    nil
  end
end
