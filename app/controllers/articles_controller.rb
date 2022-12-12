class ArticlesController < ApplicationController
  before_action :load_articles, only: %i[index show like]
  before_action :load_article_likes, only: %i[index show]

  # In index, it calls capture_article_likes to store the article details to the app DB
  def index
    capture_article_likes
  end

  # In show, if finds the record in jason as well as the matching record in app Db table
  def show
    @article = @articles.find { |article| article['id'] == params[:id].to_i }
    @local_article = @local_articles.find_by(article_unique_id: @article['id'].to_i)
  end

  # Custom action 'like': 
  # - Select the local article record by article ID from the server.
  # - Updates the local like count for the particular article record.
  # - Creates a record in like table to represent the relationship between articles and users.
  # - Adds the flash notice and redirects to the appropriate page
  def like
    @article = @articles.find { |article| article['id'] == params[:article][:article_unique_id].to_i }
    @local_article_record = Article.find_by(article_unique_id: @article['id'])

    return unless @local_article_record.update(like_params)

    Like.create(user_id: current_user.id, article_id: params[:id].to_i)
    flash[:notice] = "You have successfully liked the article: #{@article['title']}"

    if params[:article][:redirection] == 'index'
      redirect_to articles_path
    else
      redirect_to article_path(id: @article['id'])
    end
  end

  private

  # Permitting parameters for like action
  def like_params
    params.require(:article).permit(:article_unique_id, :like_count)
  end

  # Load articles from server everytime app loads index and show pages to capture and display article details 
  # straight from the server.
  def load_articles
    url = 'https://s3-eu-west-1.amazonaws.com/olio-staging-images/developer/test-articles-v4.json'
    response = RestClient.get url, { accept: :json }
    @articles = JSON.parse(response)
  end

  # Load Articles in for all of the actions
  def load_article_likes
    @local_articles = Article.all
  end

  # Captures article ids from the json and store in the app DB. (local like count for each article is defaulted to 0)
  def capture_article_likes
    article_hash = {}
    @articles.each do |article|
      article_hash[:article_unique_id] = article['id'].to_i
      Article.create(article_hash)
    end
  end
end
