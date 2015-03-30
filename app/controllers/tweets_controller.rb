class TweetsController < ApplicationController

  def index
    @tweets = Tweet.all
    @tweet = Tweet.new
  end

  def new
    @tweet = Tweet.new
  end

  def show
    @tweet= Tweet.find(params[:id])
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user.id
    @tweet.save
    respond_to do |format|
      format.html { redirect_to tweets_path }
      format.js
    end
  end

  def edit
    @tweet = Tweet.find(params[:id])
    respond_to do |format|
      format.html { redirect_to tweets_path }
      format.js
    end
  end

  def update
    @tweet = Tweet.find(params[:id])
    if @tweet.update(tweet_params)
      redirect_to tweets_path
    else
      redirect_to :back
    end
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    respond_to do |format|
      format.html { redirect_to tweets_path }
      format.js
    end
  end

  private
  def tweet_params
      params.require(:tweet).permit(:text, :user_id)
  end
end
